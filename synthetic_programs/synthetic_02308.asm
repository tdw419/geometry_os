; simple draw program
; initialization
  LDI r0, 2
  LDI r7, 0xBA3A80
  LDI r6, 0x3F48F9
  LDI r2, 0x2CE630
  LDI r10, 1681
  LDI r3, 2382
  LDI r14, 0
  LDI r13, 1
  LDI r9, 3594
  LDI r10, 2
  CIRCLE r14, r13, r9, r10
  LDI r6, 4
  LDI r8, 256
  LDI r3, 1233
  PSETI
  LDI r1, 32
  LDI r0, 16
  LDI r10, 1
  WPIXEL
  HALT
