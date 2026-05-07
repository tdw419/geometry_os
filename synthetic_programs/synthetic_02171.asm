; input driven program
; initialization
  LDI r3, 0x58179F
  LDI r1, 0x72F5FA
  LDI r4, 8
  LDI r6, 255
  LDI r13, 64
  LDI r2, 0
  LDI r14, 0x9E7EEB
main_0:
  LDI r0, 2043
  LDI r14, 1446
  LDI r2, 0xAFB37B
  DRAWTEXT r0, r14, r2, "WORLD"
  CMP r6, r9
  FRAME
  JMP main_0
