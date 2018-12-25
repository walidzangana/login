import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  void validateAndSave(){
    final form = formKey.currentState;
    form.save();
    if (form.validate()){
      print('Form is valid. email: $_email and Password: $_password');
    } else {
      print('Form is NOT Valid');
    }

  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login Demo'),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: new Column( 
            crossAxisAlignment: CrossAxisAlignment.stretch ,
            children: <Widget>[
              new TextFormField(
                validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                decoration: new InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _email = value,
                ),
              new TextFormField(
                validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                decoration: new InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) => _password = value,
              ),
              new RaisedButton(
                child: Text('Login',style: new TextStyle(fontSize: 20.0),),
                onPressed: validateAndSave,
              )
            ],
          ),
        ),
      ),
    );
  } 
}