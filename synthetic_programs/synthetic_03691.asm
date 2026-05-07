; drawing loop program
; initialization
  LDI r9, 1215
  LDI r4, 0x2B7B75
; palette
  LDI r8, 0x506F
  LDI r2, 1
  LDI r11, 0x0000FF
  STORE r8, r11
  ADD r8, r8, r2
  LDI r11, 0xAAFF00
  STORE r8, r11
  ADD r8, r8, r2
  LDI r11, 0xFF00FF
  STORE r8, r11
  ADD r8, r8, r2
  LDI r11, 0x0000FF
  STORE r8, r11
  ADD r8, r8, r2
  LDI r11, 0x0000CC
  STORE r8, r11
  ADD r8, r8, r2
main_0:
  LDI r14, 64
  LDI r14, 3767
  LDI r3, 64
  LDI r0, 0x424BF1
  LDI r9, 10
  LINE r14, r14, r3, r0, r9
  CMPI r7, 0
  XOR r3, r11, r2
  XOR r1, r5, r14
  IKEY r1
  CMPI r1, 226
  JNZ r1, key_1
  FRAME
  JMP main_0
