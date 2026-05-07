; drawing loop program
; initialization
  LDI r3, 1466
  LDI r10, 3193
  LDI r6, 0x5E40EF
  LDI r4, 0xD5998A
  LDI r1, 0
  LDI r5, 2408
  LDI r11, 0xE98ACB
main_0:
  LDI r10, 16
  LDI r6, 32
  LDI r6, 64
  TEXT r10, r6, r6, "HELLO"
  SUB r7, r9, r8
  SHR r5, r1, r13
  SHLI r0, r1, 0x1D8025
  SHL r11, r3, r2
  LDI r4, 0x637A8F
  LDI r1, 231
  LDI r2, 0xEB8913
  TEXT r4, r1, r2, "HELLO"
  FRAME
  JMP main_0
