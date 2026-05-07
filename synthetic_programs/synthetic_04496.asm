; drawing loop program
; initialization
  LDI r9, 0x66058B
  LDI r1, 0
  LDI r2, 491
  LDI r5, 10
  LDI r19, 0xCBDA10
  LDI r14, 0x050E63
  LDI r7, 0x9C69C1
main_0:
  AND r5, r12, r15
  XOR r7, r16, r13
  XOR r9, r29, r0
  LDI r4, 0x860932
  LDI r14, 2520
  LDI r14, 64
  DRAWTEXT r4, r14, r14, "WORLD"
  SUB r8, r10, r15
  LDI r13, 1
  LDI r10, 0x81D3C9
  LDI r15, 0
  DRAWTEXT r13, r10, r15, "WORLD"
  FRAME
  JMP main_0
