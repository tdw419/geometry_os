; simple draw program
; initialization
  LDI r14, 0x5EEA43
  LDI r3, 255
  LDI r7, 3473
  LDI r3, 128
  FILL r3
  LDI r1, 1383
  LDI r8, 0x3CF69F
  LDI r15, 10
  LDI r1, 0x9E852E
  CIRCLE r1, r8, r15, r1
  LDI r10, 0xB2193C
  LDI r3, 2323
  LDI r15, 0xDB7E62
  LDI r1, 32
  LDI r15, 128
  RECTF r10, r3, r15, r1, r15
  HALT
