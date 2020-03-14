import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

//Import Pages

_App app = new _App();

class _App {
  _Pages pages = new _Pages();
  _AppData data = new _AppData();

  void run(){
    runApp(_MyApp());
    data.load().then((onValue){
      data.appData = jsonDecode(onValue);
    });
  }
}

class _MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: start page,
    );
  }
}

class _Pages {
  //Instance pages
}

class _AppData {
  Map<String, dynamic> appData = new Map<String, dynamic>();

  Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return new File('${dir.path}/appdata.json');
  }

  Future<File> save() async {
    String data = json.encode(appData);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> load() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (ex) {
      return null;
    }
  }
}
