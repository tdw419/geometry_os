; drawing loop program
; initialization
  LDI r3, 0xD33EED
  LDI r1, 1
main_0:
  CMPI r2, 247
  MOD r14, r0, r13
  FRAME
  JMP main_0
