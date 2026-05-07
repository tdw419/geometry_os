; input driven program
; initialization
  LDI r11, 1456
  LDI r15, 0x5856B7
  LDI r12, 0x2F6A36
  LDI r8, 3425
  LDI r10, 8
  LDI r4, 0xEE4971
main_0:
  SAR r9, r10, r3
  SHR r8, r13, r3
  LDI r3, 0xC2315E
  LDI r10, 0x7684F6
  LDI r5, 0x776E5D
  WPIXEL
  XOR r10, r9, r7
  XOR r8, r2, r3
  XOR r9, r5, r2
  OR r11, r1, r5
  SHL r12, r8, r14
  LDI r2, 0x3505AA
  LDI r1, 1675
  LDI r8, 8
  TEXT r2, r1, r8, "HELLO"
  IKEY r30
  CMPI r30, 0x80888A
  JNZ r30, key_1
  FRAME
  JMP main_0
