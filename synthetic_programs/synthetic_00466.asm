; input driven program
; initialization
  LDI r12, 128
  LDI r1, 0x51D503
  LDI r13, 0
  LDI r2, 1764
  LDI r0, 1547
  LDI r9, 2
main_0:
  IKEY r15
  CMPI r15, 0xFB0F61
  JNZ r15, key_1
  IKEY r9
  CMPI r9, 128
  JNZ r9, key_2
  OR r13, r15, r14
  XOR r8, r5, r2
  OR r15, r9, r5
  IKEY r6
  CMPI r6, 32
  JNZ r6, key_3
  LDI r11, 2221
  FILL r11
  FRAME
  JMP main_0
