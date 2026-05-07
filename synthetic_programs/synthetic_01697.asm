; input driven program
; initialization
  LDI r31, 64
  LDI r2, 3586
  LDI r0, 0xDC1021
main_0:
  XOR r12, r6, r5
  AND r11, r15, r2
  CMP r12, r4
  LDI r5, 255
  LDI r9, 10
  LDI r10, 255
  PSET r5, r9, r10
  SHL r9, r4, r11
  FRAME
  JMP main_0
