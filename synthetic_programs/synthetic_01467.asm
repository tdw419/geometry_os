; simple draw program
; initialization
  LDI r14, 32
  LDI r4, 0x431E48
  LDI r26, 8
  LDI r2, 0x8CAD9C
  LDI r4, 256
  LDI r9, 256
  LDI r12, 64
  RECTF r26, r2, r4, r9, r12
  HALT
