; input driven program
; initialization
  LDI r9, 3350
  LDI r14, 64
  LDI r8, 2355
  LDI r25, 0xB9E96F
  LDI r6, 2
  LDI r5, 3826
main_0:
  CMPI r5, r6, 195
  SHL r9, r5, r14
  XOR r13, r11, r4
  XOR r6, r3, r14
  XOR r15, r14, r6
  FRAME
  JMP main_0
