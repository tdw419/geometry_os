; input driven program
; initialization
  LDI r29, 3102
  LDI r9, 3716
  LDI r3, 0xFA9BBF
main_0:
  AND r5, r0, r10
  OR r18, r9, r3
  OR r8, r9, r14
  OR r11, r13, r2
  IKEY r8
  CMPI r8, 0
  JNZ r8, key_1
  SHL r15, r10, r1
  SAR r10, r6, r9
  SHR r14, r15, r8
  SHR r2, r6, r10
  LDI r10, 0xDFD041
  LDI r7, 819
  LDI r20, 268
  WPIXEL
  IKEY r6
  CMPI r6, 16
  JNZ r6, key_2
  CMP r7, r5
  FRAME
  JMP main_0
