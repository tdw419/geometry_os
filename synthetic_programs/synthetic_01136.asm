; input driven program
; initialization
  LDI r2, 0x9D85DA
  LDI r11, 2075
main_0:
  LDI r12, 0x40D8B7
  LDI r9, 2005
  LDI r0, 0x57E138
  LDI r3, 32
  CIRCLE r12, r9, r0, r3
  LDI r0, 0x477DC1
  LDI r2, 4
  LDI r3, 0x04B25B
  LDI r12, 64
  LDI r5, 2522
  LINE r0, r2, r3, r12, r5
  LDI r3, 0x5B49CC
  LDI r11, 0
  LDI r4, 1
  TEXT r3, r11, r4, "HELLO"
  XOR r4, r15, r3
  AND r7, r11, r8
  XOR r9, r4, r15
  FRAME
  JMP main_0
