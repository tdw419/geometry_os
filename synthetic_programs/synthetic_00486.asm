; input driven program
; initialization
  LDI r6, 0x2093AB
  LDI r2, 0x43C2E3
main_0:
  MOD r8, r4, r5
  CMP r4, r5
  LDI r2, 64
  LDI r15, 2
  LDI r9, 1355
  LDI r3, 0
  CIRCLE r2, r15, r9, r3
  FRAME
  JMP main_0
