; simple draw program
; initialization
  LDI r1, 2
  LDI r13, 0x5323DD
  LDI r0, 559
  LDI r14, 1279
  LDI r15, 256
  LDI r2, 1878
  LDI r5, 530
  LDI r31, 0x4A17E9
  RECTF r14, r15, r2, r5, r31
  LDI r2, 893
  LDI r13, 10
  LDI r5, 2716
  LDI r2, 32
  LDI r10, 0xF47A7F
  RECTF r2, r13, r5, r2, r10
  LDI r8, 128
  LDI r2, 0xCFD130
  LDI r6, 2301
  PSET r8, r2, r6
  HALT
