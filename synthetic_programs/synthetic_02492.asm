; simple draw program
; initialization
  LDI r11, 0xAD12EE
  LDI r14, 0x535923
  LDI r4, 0x302D2A
  LDI r1, 0xAF7F42
  LDI r4, 0xDE6424
  LDI r13, 0x85C3C3
  LDI r1, 1624
  CIRCLE r1, r4, r13, r1
  LDI r13, 119
  LDI r7, 0xC5582B
  LDI r9, 256
  PSETI
  LDI r12, 32
  FILL r12
  HALT
