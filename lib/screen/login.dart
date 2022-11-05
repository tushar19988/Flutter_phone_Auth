import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String country = "+91";
  String phone = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Login With Phone",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.4,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              margin: EdgeInsets.symmetric(horizontal: 20.r),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.grey.shade300,
              ),
              child:  TextField(
                onChanged: (value){
                  phone = value;
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Phone Number",
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 34.h,
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '+91 8200110672',
                    verificationCompleted: (PhoneAuthCredential credential) {
                      print("phonecred $credential");
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      print("error $e");
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      print("id $verificationId");
                      print("token $resendToken");
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {
                      print("verificationId $verificationId");
                    },
                  );
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
