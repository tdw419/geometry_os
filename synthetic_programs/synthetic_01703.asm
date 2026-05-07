; input driven program
; initialization
  LDI r8, 0xBBBFCC
  LDI r12, 64
main_0:
  LDI r11, 1175
  LDI r23, 1950
  LDI r6, 0
  TEXT r11, r23, r6, "HELLO"
  ANDI r4, r13, 66
  FRAME
  JMP main_0
