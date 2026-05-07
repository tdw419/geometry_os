; input driven program
; initialization
  LDI r3, 0x563C99
  LDI r2, 423
  LDI r0, 0x9129C9
  LDI r8, 0x8D3FA5
  LDI r11, 0xE36A76
main_0:
  IKEY r25
  CMPI r25, 8
  JNZ r25, key_1
  LDI r0, 2
  LDI r8, 16
  LDI r6, 353
  LDI r25, 1459
  LDI r14, 3598
  LINE r0, r8, r6, r25, r14
  FRAME
  JMP main_0
