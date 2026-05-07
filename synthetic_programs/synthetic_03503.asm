; drawing loop program
; initialization
  LDI r7, 2240
  LDI r12, 1
  LDI r17, 2
  LDI r10, 0x1E0C33
  LDI r26, 16
; palette
  LDI r5, 0x30EA
  LDI r14, 1
  LDI r11, 0x00FFFF
  STORE r5, r11
  ADD r5, r5, r14
  LDI r11, 0xFFFFFF
  STORE r5, r11
  ADD r5, r5, r14
  LDI r11, 0x0000FF
  STORE r5, r11
  ADD r5, r5, r14
  LDI r11, 0x550077
  STORE r5, r11
  ADD r5, r5, r14
  LDI r11, 0x00FF00
  STORE r5, r11
  ADD r5, r5, r14
  LDI r11, 0x0044FF
  STORE r5, r11
  ADD r5, r5, r14
  LDI r11, 0x000066
  STORE r5, r11
  ADD r5, r5, r14
  LDI r11, 0x00FF00
  STORE r5, r11
  ADD r5, r5, r14
  LDI r11, 0x0000FF
  STORE r5, r11
  ADD r5, r5, r14
  LDI r11, 0xAA00AA
  STORE r5, r11
  ADD r5, r5, r14
  LDI r11, 0xAA00AA
  STORE r5, r11
  ADD r5, r5, r14
  LDI r11, 0xFFFF00
  STORE r5, r11
  ADD r5, r5, r14
  LDI r11, 0x008888
  STORE r5, r11
  ADD r5, r5, r14
  LDI r11, 0x00FFAA
  STORE r5, r11
  ADD r5, r5, r14
main_0:
  LDI r9, 64
  LDI r0, 0xCCAC5A
  LDI r8, 668
  WPIXEL
  LDI r9, 1668
  LDI r4, 0
  LDI r3, 0xD13511
  PSETI
  FRAME
  JMP main_0
