; drawing loop program
; initialization
  LDI r1, 4
  LDI r10, 32
  LDI r11, 539
  LDI r13, 0x4A0F50
  LDI r8, 2940
; palette
  LDI r3, 0x30F6
  LDI r7, 1
  LDI r8, 0x008888
  STORE r3, r8
  ADD r3, r3, r7
  LDI r8, 0xAA00AA
  STORE r3, r8
  ADD r3, r3, r7
  LDI r8, 0x0044FF
  STORE r3, r8
  ADD r3, r3, r7
  LDI r8, 0x0000CC
  STORE r3, r8
  ADD r3, r3, r7
  LDI r8, 0xFFEE00
  STORE r3, r8
  ADD r3, r3, r7
  LDI r8, 0x00FF44
  STORE r3, r8
  ADD r3, r3, r7
  LDI r8, 0x888800
  STORE r3, r8
  ADD r3, r3, r7
  LDI r8, 0xDD0044
  STORE r3, r8
  ADD r3, r3, r7
  LDI r8, 0xFFFF00
  STORE r3, r8
  ADD r3, r3, r7
  LDI r8, 0xFFAA00
  STORE r3, r8
  ADD r3, r3, r7
main_0:
  IKEY r4
  CMPI r4, 16
  JNZ r4, key_1
  LDI r6, 0x3C8BB0
  LDI r1, 0x460B5C
  LDI r12, 0xD992C0
  TEXT r6, r1, r12, "HELLO"
  LDI r4, 4
  LDI r11, 128
  LDI r14, 2958
  DRAWTEXT r4, r11, r14, "WORLD"
  SAR r4, r7, r12
  SHL r5, r13, r4
  FRAME
  JMP main_0
