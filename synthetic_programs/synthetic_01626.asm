; drawing loop program
; initialization
  LDI r14, 64
  LDI r2, 2
  LDI r1, 32
  LDI r13, 1
  LDI r8, 0xFD3F15
main_0:
  CMP r17, r3
  AND r7, r14, r1
  OR r25, r10, r1
  OR r5, r9, r10
  LDI r1, 1331
  LDI r15, 0x520CD9
  LDI r9, 0xE17F3B
  PSET r1, r15, r9
  CMP r9, r16
  FRAME
  JMP main_0
