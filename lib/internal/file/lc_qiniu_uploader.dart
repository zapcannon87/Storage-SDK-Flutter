part of leancloud_storage;

/// 七牛直传方式
class QiniuUploader {
  String uploadUrl;

  String token;

  String key;

  Uint8List data;

  QiniuUploader(this.uploadUrl, this.token, this.key, this.data);

  Future<void> upload(void Function(int count, int total) onProgress) async {
    Dio dio = new Dio();
    FormData formData = FormData.fromMap({
      'key': key,
      'token': token,
      'file': MultipartFile.fromBytes(data)
    });
    await dio.post(uploadUrl, data: formData, onSendProgress: onProgress);
  }
}