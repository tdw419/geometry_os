; input driven program
; initialization
  LDI r21, 32
  LDI r6, 0x43FF15
main_0:
  AND r24, r10, r8
  XOR r15, r8, r12
  OR r13, r15, r5
  AND r25, r7, r13
  SUBI r1, r12, 0x45127E
  LDI r11, 2
  LDI r15, 0x953E1A
  LDI r13, 10
  LDI r11, 0xE8FF45
  LDI r11, 64
  RECTF r11, r15, r13, r11, r11
  XOR r9, r2, r13
  XOR r8, r11, r14
  OR r13, r7, r15
  IKEY r8
  CMPI r8, 1
  JNZ r8, key_1
  CMPI r13, 0xC46A0C
  FRAME
  JMP main_0
