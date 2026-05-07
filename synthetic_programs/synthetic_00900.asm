; drawing loop program
; initialization
  LDI r9, 16
  LDI r14, 573
  LDI r24, 0xB4A5D9
; palette
  LDI r15, 0x2207
  LDI r11, 1
  LDI r2, 0x00AAFF
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0x550077
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0x000000
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0xAAFF00
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0xFF00FF
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0xFF00FF
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0xFF8800
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0x00AAFF
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0xAAFF00
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0x00FFFF
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0x00FFFF
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0x550077
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0xFF4400
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0x0000CC
  STORE r15, r2
  ADD r15, r15, r11
main_0:
  IKEY r15
  CMPI r15, 32
  JNZ r15, key_1
  SHL r12, r5, r6
  SAR r0, r3, r14
  SHL r1, r6, r15
  SAR r3, r15, r12
  LDI r4, 662
  LDI r2, 0x33DE44
  LDI r3, 297
  TEXT r4, r2, r3, "HELLO"
  FRAME
  JMP main_0
