; drawing loop program
; initialization
  LDI r3, 32
  LDI r7, 286
  LDI r4, 2875
  LDI r8, 4
  LDI r6, 8
  LDI r12, 64
; palette
  LDI r15, 0x2328
  LDI r11, 1
  LDI r4, 0x8800FF
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0x888800
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0x880088
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0xFFEE00
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0x0044FF
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0x00FFFF
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0x00FF44
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0xFFEE00
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0x000066
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0xFFEE00
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0xAAFF00
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0xAAAAAA
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0xAAFF00
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0x000000
  STORE r15, r4
  ADD r15, r15, r11
  LDI r4, 0x00AAFF
  STORE r15, r4
  ADD r15, r15, r11
main_0:
  OR r6, r2, r12
  IKEY r4
  CMPI r4, 8
  JNZ r4, key_1
  SHL r27, r11, r7
  SAR r21, r15, r5
  LDI r13, 0xE042FD
  LDI r4, 0x2BFE89
  LDI r4, 0x0D30E3
  PSETI
  LDI r5, 0xEB4DFC
  LDI r10, 0x3F3099
  LDI r9, 0x7B30AE
  DRAWTEXT r5, r10, r9, "WORLD"
  LDI r8, 0x530211
  LDI r8, 359
  LDI r8, 3147
  TEXT r8, r8, r8, "HELLO"
  FRAME
  JMP main_0
