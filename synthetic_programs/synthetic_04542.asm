; simple draw program
; initialization
  LDI r4, 0xFE4D01
  LDI r9, 0x1F8D01
  LDI r7, 0xD52B0D
  LDI r3, 128
  LDI r14, 0x0F37B9
  LDI r2, 10
  LDI r14, 0xCD0791
  RECTF r7, r3, r14, r2, r14
  LDI r9, 1151
  LDI r5, 268
  LDI r3, 1137
  LDI r0, 3493
  CIRCLE r9, r5, r3, r0
  LDI r1, 3798
  LDI r2, 3205
  LDI r28, 256
  PSET r1, r2, r28
  HALT
