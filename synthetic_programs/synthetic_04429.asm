; simple draw program
; initialization
  LDI r14, 1872
  LDI r15, 0xCCB535
  LDI r3, 256
  LDI r7, 678
  LDI r0, 10
  LDI r2, 16
  LDI r4, 0x00EFDD
  LINE r3, r7, r0, r2, r4
  LDI r10, 1403
  LDI r12, 862
  LDI r14, 0xB47485
  LDI r13, 2306
  CIRCLE r10, r12, r14, r13
  LDI r0, 2319
  LDI r0, 0xC00E82
  LDI r2, 0xEED78E
  WPIXEL
  HALT
