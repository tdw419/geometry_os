; drawing loop program
; initialization
  LDI r12, 2151
  LDI r11, 63
; palette
  LDI r5, 0x2062
  LDI r8, 1
  LDI r9, 0xFF0000
  STORE r5, r9
  ADD r5, r5, r8
  LDI r9, 0xFFAA00
  STORE r5, r9
  ADD r5, r5, r8
  LDI r9, 0x0000CC
  STORE r5, r9
  ADD r5, r5, r8
  LDI r9, 0xFFEE00
  STORE r5, r9
  ADD r5, r5, r8
  LDI r9, 0xAA00AA
  STORE r5, r9
  ADD r5, r5, r8
  LDI r9, 0xFF00FF
  STORE r5, r9
  ADD r5, r5, r8
  LDI r9, 0xAAFF00
  STORE r5, r9
  ADD r5, r5, r8
  LDI r9, 0x008888
  STORE r5, r9
  ADD r5, r5, r8
  LDI r9, 0xAAFF00
  STORE r5, r9
  ADD r5, r5, r8
main_0:
  LDI r11, 919
  LDI r10, 255
  LDI r10, 128
  DRAWTEXT r11, r10, r10, "WORLD"
  LDI r10, 3045
  LDI r2, 0x4F7848
  LDI r1, 1631
  LDI r4, 4
  CIRCLE r10, r2, r1, r4
  CMPI r31, 169
  IKEY r9
  CMPI r9, 158
  JNZ r9, key_1
  FRAME
  JMP main_0
