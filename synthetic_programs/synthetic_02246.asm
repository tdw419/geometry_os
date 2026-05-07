; drawing loop program
; initialization
  LDI r10, 128
  LDI r2, 8
  LDI r6, 2267
  LDI r12, 0x4F006A
  LDI r25, 4
  LDI r27, 1745
; palette
  LDI r4, 0x70CF
  LDI r15, 1
  LDI r7, 0x00FFAA
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0x0044FF
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0xFF0000
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0xFFEE00
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0x44FF00
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0x0000CC
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0xDD0044
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0xFF00FF
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0x0000CC
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0xFF4400
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0xFFFFFF
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0x0044FF
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0xAAFF00
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0xFF4400
  STORE r4, r7
  ADD r4, r4, r15
  LDI r7, 0x44FF00
  STORE r4, r7
  ADD r4, r4, r15
main_0:
  SUBI r2, r11, 16
  CMPI r14, 0xA68F6C
  FRAME
  JMP main_0
