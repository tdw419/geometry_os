; drawing loop program
; initialization
  LDI r6, 10
  LDI r10, 2
  LDI r0, 4
main_0:
  LDI r20, 4
  LDI r8, 4
  LDI r3, 0x3A02BC
  DRAWTEXT r20, r8, r3, "WORLD"
  LDI r1, 1849
  FILL r1
  SHL r14, r13, r3
  SHL r7, r14, r9
  SUBI r11, r7, 164
  FRAME
  JMP main_0
