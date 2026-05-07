; drawing loop program
; initialization
  LDI r14, 1889
  LDI r1, 4063
main_0:
  AND r14, r12, r8
  AND r4, r13, r3
  AND r10, r2, r9
  XOR r12, r3, r10
  LDI r5, 2312
  LDI r6, 1921
  LDI r30, 2
  DRAWTEXT r5, r6, r30, "WORLD"
  LDI r15, 732
  LDI r6, 696
  LDI r18, 489
  PSETI
  SUB r2, r15, r13
  CMPI r14, 3
  FRAME
  JMP main_0
