; input driven program
; initialization
  LDI r6, 3081
  LDI r14, 0
main_0:
  IKEY r6
  CMPI r6, 0xEF76F5
  JNZ r6, key_1
  LDI r9, 4
  LDI r2, 0x7E5661
  LDI r1, 1252
  LDI r3, 4
  LDI r14, 0xCBF867
  LINE r9, r2, r1, r3, r14
  SUBI r4, r9, 64
  SHL r1, r15, r12
  SHL r8, r11, r3
  SHL r5, r3, r11
  FRAME
  JMP main_0
