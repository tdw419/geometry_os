; simple draw program
; initialization
  LDI r12, 2512
  LDI r6, 0xDA8050
  LDI r8, 4
  LDI r7, 1
  LDI r5, 3064
  LDI r9, 3478
  FILL r9
  LDI r6, 64
  LDI r13, 0x4403EE
  LDI r6, 4
  PSET r6, r13, r6
  HALT
