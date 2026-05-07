; drawing loop program
; initialization
  LDI r2, 854
  LDI r26, 128
  LDI r6, 2094
  LDI r7, 3821
  LDI r3, 416
  LDI r9, 2
; palette
  LDI r3, 0x2298
  LDI r8, 1
  LDI r9, 0x00FFAA
  STORE r3, r9
  ADD r3, r3, r8
  LDI r9, 0xFF8800
  STORE r3, r9
  ADD r3, r3, r8
  LDI r9, 0x0044FF
  STORE r3, r9
  ADD r3, r3, r8
  LDI r9, 0x0044FF
  STORE r3, r9
  ADD r3, r3, r8
  LDI r9, 0x00FFFF
  STORE r3, r9
  ADD r3, r3, r8
  LDI r9, 0x0000FF
  STORE r3, r9
  ADD r3, r3, r8
  LDI r9, 0x888800
  STORE r3, r9
  ADD r3, r3, r8
  LDI r9, 0x0000CC
  STORE r3, r9
  ADD r3, r3, r8
  LDI r9, 0xAA00AA
  STORE r3, r9
  ADD r3, r3, r8
  LDI r9, 0x0044FF
  STORE r3, r9
  ADD r3, r3, r8
main_0:
  LDI r10, 197
  LDI r7, 3613
  LDI r3, 0xE68D3C
  WPIXEL
  CMPI r1, 255
  LDI r10, 0x328AE9
  LDI r13, 2154
  LDI r13, 650
  WPIXEL
  LDI r5, 0xA1127E
  LDI r11, 3030
  LDI r10, 2298
  TEXT r5, r11, r10, "HELLO"
  FRAME
  JMP main_0
