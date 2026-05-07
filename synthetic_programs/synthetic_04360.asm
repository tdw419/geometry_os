; drawing loop program
; initialization
  LDI r5, 10
  LDI r10, 1841
; palette
  LDI r15, 0x2081
  LDI r1, 1
  LDI r7, 0xDD0044
  STORE r15, r7
  ADD r15, r15, r1
  LDI r7, 0x44FF00
  STORE r15, r7
  ADD r15, r15, r1
  LDI r7, 0x00FF44
  STORE r15, r7
  ADD r15, r15, r1
  LDI r7, 0xFFEE00
  STORE r15, r7
  ADD r15, r15, r1
  LDI r7, 0xDD0044
  STORE r15, r7
  ADD r15, r15, r1
  LDI r7, 0xFF0000
  STORE r15, r7
  ADD r15, r15, r1
  LDI r7, 0x008888
  STORE r15, r7
  ADD r15, r15, r1
  LDI r7, 0x000000
  STORE r15, r7
  ADD r15, r15, r1
  LDI r7, 0xFFAA00
  STORE r15, r7
  ADD r15, r15, r1
  LDI r7, 0x000066
  STORE r15, r7
  ADD r15, r15, r1
  LDI r7, 0x880088
  STORE r15, r7
  ADD r15, r15, r1
main_0:
  ADD r5, r18, r7
  IKEY r11
  CMPI r11, 38
  JNZ r11, key_1
  SAR r11, r3, r15
  SHL r3, r12, r1
  SHL r10, r7, r0
  FRAME
  JMP main_0
