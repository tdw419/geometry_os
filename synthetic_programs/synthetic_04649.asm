; input driven program
; initialization
  LDI r6, 0x174D1D
  LDI r2, 0
main_0:
  SUB r4, r3, r11
  CMP r3, r11
  LDI r2, 0xCFA68B
  LDI r11, 8
  LDI r14, 0x94AC85
  LDI r1, 1584
  LDI r11, 2268
  LINE r2, r11, r14, r1, r11
  IKEY r7
  CMPI r7, 8
  JNZ r7, key_1
  FRAME
  JMP main_0
