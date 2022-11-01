import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tsa_location/home_page.dart';
import 'package:tsa_location/login_page.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: ListView(
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(
                      "Silahkan login dengan akun anda",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 11,
                          // fontWeight: FontWeight,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                "Email",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  new Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Icon(Icons.person,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        focusColor: Theme.of(context).colorScheme.primary,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: 'ex@gmail.com',
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                "Password",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Icon(Icons.lock_open,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                  ),
                  new Expanded(
                    child: TextField(
                      obscureText: true,
                      controller: _passController,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: '*******',
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 18,
                  margin: const EdgeInsets.only(top: 20.0),
                  // padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primary),
                    onPressed: () async {
                    await Hive.openBox("user");
                      var hive = Hive.box("user");
                      hive.put('email', _emailController.text);
                      hive.put('password', _passController.text);
                      //  Get.off(HomePage());

                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Text(
                      "Register",
                      // style:
                      //     TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: TextButton(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Sudah punya akun? Login Disini",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 10.0),
                      ),
                    ),
                    onPressed: () => {
                      Get.off(()=>LoginPage())
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Logn()))
                    },
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

void register(email, password) {
  var hive = Hive.box("user");
  hive.put('email', email);
  hive.put('password', password);
}
