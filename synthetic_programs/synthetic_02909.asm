; drawing loop program
; initialization
  LDI r3, 0xA2B638
  LDI r15, 32
  LDI r9, 0x1FB6DE
; palette
  LDI r10, 0x24A5
  LDI r3, 1
  LDI r11, 0xAAAAAA
  STORE r10, r11
  ADD r10, r10, r3
  LDI r11, 0x008888
  STORE r10, r11
  ADD r10, r10, r3
  LDI r11, 0xFF00FF
  STORE r10, r11
  ADD r10, r10, r3
  LDI r11, 0xFFFF00
  STORE r10, r11
  ADD r10, r10, r3
  LDI r11, 0xFFEE00
  STORE r10, r11
  ADD r10, r10, r3
  LDI r11, 0x00FF44
  STORE r10, r11
  ADD r10, r10, r3
  LDI r11, 0x00AAFF
  STORE r10, r11
  ADD r10, r10, r3
  LDI r11, 0xAAFF00
  STORE r10, r11
  ADD r10, r10, r3
  LDI r11, 0xFFAA00
  STORE r10, r11
  ADD r10, r10, r3
  LDI r11, 0x550077
  STORE r10, r11
  ADD r10, r10, r3
  LDI r11, 0x888800
  STORE r10, r11
  ADD r10, r10, r3
  LDI r11, 0x550077
  STORE r10, r11
  ADD r10, r10, r3
  LDI r11, 0x000000
  STORE r10, r11
  ADD r10, r10, r3
  LDI r11, 0x00AAFF
  STORE r10, r11
  ADD r10, r10, r3
main_0:
  CMPI r7, 201
  LDI r1, 199
  LDI r4, 1154
  LDI r5, 0x72C9E8
  DRAWTEXT r1, r4, r5, "WORLD"
  FRAME
  JMP main_0
