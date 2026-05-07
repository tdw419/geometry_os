; input driven program
; initialization
  LDI r25, 64
  LDI r2, 0x01A493
  LDI r4, 10
main_0:
  IKEY r4
  CMPI r4, 0xA96B24
  JNZ r4, key_1
  CMPI r14, 199
  IKEY r12
  CMPI r12, 90
  JNZ r12, key_2
  LDI r7, 3430
  LDI r3, 1168
  LDI r15, 32
  TEXT r7, r3, r15, "HELLO"
  OR r6, r4, r13
  AND r7, r11, r9
  XOR r13, r6, r14
  AND r9, r2, r6
  FRAME
  JMP main_0
