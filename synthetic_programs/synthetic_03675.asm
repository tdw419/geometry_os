; drawing loop program
; initialization
  LDI r1, 1846
  LDI r14, 0x68D593
  LDI r4, 0xF093B2
  LDI r7, 4
  LDI r15, 256
main_0:
  ANDI r10, r7, 252
  XOR r4, r3, r2
  AND r9, r10, r5
  AND r14, r12, r1
  LDI r12, 16
  LDI r8, 3390
  LDI r13, 8
  PSET r12, r8, r13
  FRAME
  JMP main_0
