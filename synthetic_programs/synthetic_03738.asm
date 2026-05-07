; input driven program
; initialization
  LDI r14, 128
  LDI r3, 3964
  LDI r2, 0
  LDI r15, 2328
  LDI r8, 2252
  LDI r5, 849
  LDI r0, 3079
  LDI r11, 10
main_0:
  ANDI r7, r6, 19
  AND r7, r5, r11
  OR r6, r13, r0
  OR r7, r9, r1
  OR r0, r3, r15
  LDI r4, 0x30DF73
  LDI r2, 3021
  LDI r16, 2
  DRAWTEXT r4, r2, r16, "WORLD"
  FRAME
  JMP main_0
