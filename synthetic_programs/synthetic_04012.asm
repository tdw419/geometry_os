; simple draw program
; initialization
  LDI r6, 1582
  LDI r13, 1049
  LDI r2, 242
  LDI r14, 0x50449A
  LDI r4, 0x5908A4
  LDI r5, 0x4800D8
  WPIXEL
  LDI r12, 0xFBC218
  LDI r6, 1
  LDI r2, 256
  LDI r12, 64
  CIRCLE r12, r6, r2, r12
  HALT
