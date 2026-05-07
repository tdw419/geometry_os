; input driven program
; initialization
  LDI r4, 0x7D6928
  LDI r2, 2529
  LDI r12, 2606
main_0:
  LDI r11, 1079
  LDI r0, 1267
  LDI r10, 0
  LDI r3, 0xADC2FE
  LDI r14, 0xB8F3B4
  LINE r11, r0, r10, r3, r14
  CMPI r4, 2
  SHL r7, r11, r14
  IKEY r14
  CMPI r14, 77
  JNZ r14, key_1
  FRAME
  JMP main_0
