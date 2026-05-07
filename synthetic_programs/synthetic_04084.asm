; drawing loop program
; initialization
  LDI r9, 8
  LDI r8, 0x926B3A
  LDI r11, 10
  LDI r7, 10
  LDI r5, 3307
; palette
  LDI r13, 0x800C
  LDI r8, 1
  LDI r2, 0x008888
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x44FF00
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x00FF44
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0xFF4400
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0xFFFFFF
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0xFF0000
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0xFFAA00
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x00FFFF
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x00FFAA
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0xFFFF00
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0xFF0000
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0xFFEE00
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x00FFFF
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x880088
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0xFF4400
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x00AAFF
  STORE r13, r2
  ADD r13, r13, r8
main_0:
  SUBI r11, r4, 157
  LDI r7, 2116
  LDI r3, 0xCDFE1B
  LDI r20, 0x54A602
  PSETI
  CMPI r9, r6, 0xC524E5
  LDI r21, 0x01F82A
  LDI r0, 4
  LDI r9, 143
  LDI r8, 256
  CIRCLE r21, r0, r9, r8
  LDI r12, 0x0D99B5
  LDI r8, 0x3BEAC1
  LDI r4, 10
  PSETI
  FRAME
  JMP main_0
