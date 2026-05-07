; simple draw program
; initialization
  LDI r8, 32
  LDI r7, 1375
  LDI r4, 98
  LDI r10, 0x86E155
  LDI r5, 1
  FILL r5
  LDI r10, 2388
  LDI r6, 0xAC81FD
  LDI r0, 4
  PSET r10, r6, r0
  LDI r10, 1703
  LDI r10, 2604
  LDI r13, 32
  LDI r2, 0xADE73E
  LDI r1, 64
  RECTF r10, r10, r13, r2, r1
  HALT
