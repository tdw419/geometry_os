; simple draw program
; initialization
  LDI r6, 64
  LDI r2, 1
  LDI r21, 64
  LDI r5, 256
  LDI r9, 2
  WPIXEL
  LDI r12, 3929
  LDI r15, 575
  LDI r12, 4
  LDI r15, 0xCD29DB
  LDI r7, 128
  RECTF r12, r15, r12, r15, r7
  LDI r4, 0x3A627D
  FILL r4
  HALT
