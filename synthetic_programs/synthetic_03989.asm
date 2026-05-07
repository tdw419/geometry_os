; simple draw program
; initialization
  LDI r5, 725
  LDI r15, 1
  LDI r0, 4
  LDI r4, 0xF157E8
  LDI r7, 64
  LDI r14, 8
  CIRCLE r0, r4, r7, r14
  LDI r10, 0x704C21
  LDI r3, 0xCF4B6F
  LDI r1, 0x80CCB8
  WPIXEL
  LDI r6, 4
  LDI r9, 0xC1D22D
  LDI r8, 1141
  LDI r3, 1243
  CIRCLE r6, r9, r8, r3
  HALT
