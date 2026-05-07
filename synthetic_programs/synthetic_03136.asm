; input driven program
; initialization
  LDI r15, 3953
  LDI r6, 1
  LDI r25, 0
main_0:
  LDI r8, 1339
  LDI r9, 16
  LDI r15, 3896
  LDI r11, 10
  LDI r3, 790
  RECTF r8, r9, r15, r11, r3
  CMP r4, r5
  SHR r15, r0, r8
  IKEY r0
  CMPI r0, 0x1DBB95
  JNZ r0, key_1
  OR r15, r8, r31
  XOR r7, r13, r1
  XOR r14, r12, r11
  FRAME
  JMP main_0
