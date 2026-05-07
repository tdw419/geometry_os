; drawing loop program
; initialization
  LDI r5, 1960
  LDI r3, 2038
  LDI r1, 128
  LDI r6, 0xB45B0C
  LDI r11, 2731
  LDI r2, 1596
  LDI r13, 2522
main_0:
  OR r13, r2, r8
  XOR r9, r13, r15
  AND r12, r2, r15
  SHL r11, r2, r0
  LDI r10, 1368
  LDI r6, 0xA131D0
  LDI r7, 479
  LDI r3, 1473
  CIRCLE r10, r6, r7, r3
  CMP r9, r15
  AND r6, r14, r10
  AND r7, r4, r15
  XOR r6, r12, r7
  AND r15, r8, r14
  FRAME
  JMP main_0
