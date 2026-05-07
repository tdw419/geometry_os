; drawing loop program
; initialization
  LDI r4, 256
  LDI r0, 613
; palette
  LDI r4, 0x6038
  LDI r9, 1
  LDI r3, 0xDD0044
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x0000FF
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x00FFAA
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x00AAFF
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x00AAFF
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0xFF8800
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x0000FF
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0xFFEE00
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x00FF00
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x00FFFF
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0xFFAA00
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0xFFFF00
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x008888
  STORE r4, r3
  ADD r4, r4, r9
main_0:
  LDI r23, 0xFA8292
  LDI r7, 0
  LDI r7, 2
  LDI r4, 0x0BB47F
  LDI r7, 3642
  RECTF r23, r7, r7, r4, r7
  LDI r25, 1122
  LDI r11, 0x159515
  LDI r14, 1155
  LDI r29, 0xCF4AE7
  LDI r26, 0xD7FFF7
  RECTF r25, r11, r14, r29, r26
  ANDI r2, r10, 32
  MOD r7, r8, r1
  DIV r2, r6, r14
  FRAME
  JMP main_0
