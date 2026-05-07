; simple draw program
; initialization
  LDI r7, 0x16C691
  LDI r8, 0xA4CCC7
  LDI r0, 940
  LDI r4, 0xBA5843
  LDI r7, 3767
  LDI r9, 3913
  LDI r1, 0
  LDI r2, 1385
  CIRCLE r7, r9, r1, r2
  LDI r0, 32
  LDI r4, 0x24E86C
  LDI r12, 128
  PSETI
  LDI r4, 0
  LDI r12, 575
  LDI r5, 10
  PSETI
  HALT
