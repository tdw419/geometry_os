; drawing loop program
; initialization
  LDI r13, 0xC6B6DA
  LDI r15, 3237
; palette
  LDI r12, 0x22B8
  LDI r7, 1
  LDI r15, 0x8800FF
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x000066
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x444444
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0xFFFF00
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0xAAAAAA
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x000000
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0xFFAA00
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0xFFEE00
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0xFF00FF
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x0000FF
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x44FF00
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x00FF00
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x444444
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x000066
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0xFF00FF
  STORE r12, r15
  ADD r12, r12, r7
main_0:
  ANDI r2, r6, 255
  LDI r1, 2528
  LDI r11, 3268
  LDI r13, 10
  DRAWTEXT r1, r11, r13, "WORLD"
  IKEY r8
  CMPI r8, 255
  JNZ r8, key_1
  MUL r28, r15, r7
  CMPI r8, 256
  FRAME
  JMP main_0
