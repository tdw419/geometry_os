; drawing loop program
; initialization
  LDI r4, 1
  LDI r15, 1301
  LDI r13, 0x16CB1F
  LDI r6, 3640
  LDI r9, 2
  LDI r8, 2109
  LDI r11, 0x65CBB7
main_0:
  XOR r10, r13, r4
  LDI r11, 2
  LDI r14, 10
  LDI r11, 280
  LDI r3, 1422
  LDI r15, 1076
  RECTF r11, r14, r11, r3, r15
  SUBI r3, r0, 93
  AND r14, r6, r11
  MUL r2, r13, r7
  FRAME
  JMP main_0
