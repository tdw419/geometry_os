; input driven program
; initialization
  LDI r13, 1
  LDI r12, 0x250598
  LDI r2, 0x540E30
  LDI r3, 2234
main_0:
  LDI r2, 64
  LDI r10, 944
  LDI r4, 1179
  DRAWTEXT r2, r10, r4, "WORLD"
  LDI r1, 8
  LDI r14, 0x0E9B5A
  LDI r6, 3816
  PSETI
  SAR r6, r5, r8
  SHLI r4, r15, 2
  SHLI r4, r2, 32
  FRAME
  JMP main_0
