; drawing loop program
; initialization
  LDI r13, 1602
  LDI r8, 10
  LDI r2, 0xD46C02
  LDI r14, 32
  LDI r12, 842
  LDI r3, 805
; palette
  LDI r4, 0x242F
  LDI r1, 1
  LDI r3, 0x00FFFF
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0x0000CC
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0x0000CC
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0xFF0000
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0x00FF00
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0x444444
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0x44FF00
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0x888800
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0xFF0000
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0xFF0000
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0xAA00AA
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0x00FFAA
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0x00FF44
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0x00FF00
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0xFFFFFF
  STORE r4, r3
  ADD r4, r4, r1
  LDI r3, 0xFFAA00
  STORE r4, r3
  ADD r4, r4, r1
main_0:
  IKEY r10
  CMPI r10, 255
  JNZ r10, key_1
  CMPI r15, 64
  IKEY r3
  CMPI r3, 32
  JNZ r3, key_2
  CMPI r8, r0, 64
  MUL r2, r3, r4
  SUBI r4, r12, 99
  FRAME
  JMP main_0
