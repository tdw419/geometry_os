; input driven program
; initialization
  LDI r5, 0x719924
  LDI r3, 424
main_0:
  LDI r8, 419
  LDI r0, 3345
  LDI r3, 0x152E13
  DRAWTEXT r8, r0, r3, "WORLD"
  SHL r13, r9, r2
  SHLI r11, r13, 5
  SHLI r13, r5, 255
  SHLI r1, r13, 1
  LDI r0, 0
  LDI r9, 3747
  LDI r2, 240
  LDI r0, 0x8AB129
  LDI r14, 763
  RECTF r0, r9, r2, r0, r14
  DIV r6, r13, r1
  LDI r2, 3925
  LDI r10, 2
  LDI r3, 1649
  LDI r1, 3336
  CIRCLE r2, r10, r3, r1
  FRAME
  JMP main_0
