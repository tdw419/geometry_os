; drawing loop program
; initialization
  LDI r2, 0x9E05BC
  LDI r11, 0
; palette
  LDI r7, 0x50FE
  LDI r6, 1
  LDI r4, 0x550077
  STORE r7, r4
  ADD r7, r7, r6
  LDI r4, 0x44FF00
  STORE r7, r4
  ADD r7, r7, r6
  LDI r4, 0x00AAFF
  STORE r7, r4
  ADD r7, r7, r6
  LDI r4, 0x880088
  STORE r7, r4
  ADD r7, r7, r6
  LDI r4, 0xFF00FF
  STORE r7, r4
  ADD r7, r7, r6
  LDI r4, 0xFF8800
  STORE r7, r4
  ADD r7, r7, r6
  LDI r4, 0x000000
  STORE r7, r4
  ADD r7, r7, r6
  LDI r4, 0xFF00FF
  STORE r7, r4
  ADD r7, r7, r6
  LDI r4, 0xFF0000
  STORE r7, r4
  ADD r7, r7, r6
  LDI r4, 0xDD0044
  STORE r7, r4
  ADD r7, r7, r6
  LDI r4, 0x44FF00
  STORE r7, r4
  ADD r7, r7, r6
  LDI r4, 0xFFAA00
  STORE r7, r4
  ADD r7, r7, r6
  LDI r4, 0x00FF00
  STORE r7, r4
  ADD r7, r7, r6
main_0:
  ANDI r9, r11, 0xD58F3F
  CMP r3, r7
  SHL r10, r5, r8
  SHR r8, r6, r10
  SHL r14, r12, r11
  LDI r28, 3730
  LDI r15, 3156
  LDI r4, 64
  DRAWTEXT r28, r15, r4, "WORLD"
  SHR r9, r6, r3
  SHL r10, r7, r12
  SAR r4, r2, r15
  FRAME
  JMP main_0
