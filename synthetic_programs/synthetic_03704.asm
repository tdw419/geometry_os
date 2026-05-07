; drawing loop program
; initialization
  LDI r1, 0xEBF923
  LDI r6, 0x1BCD0E
  LDI r4, 1540
; palette
  LDI r15, 0x24B5
  LDI r11, 1
  LDI r30, 0x0000FF
  STORE r15, r30
  ADD r15, r15, r11
  LDI r30, 0x880088
  STORE r15, r30
  ADD r15, r15, r11
  LDI r30, 0x0044FF
  STORE r15, r30
  ADD r15, r15, r11
  LDI r30, 0xFF8800
  STORE r15, r30
  ADD r15, r15, r11
  LDI r30, 0xFF00FF
  STORE r15, r30
  ADD r15, r15, r11
  LDI r30, 0xFFFFFF
  STORE r15, r30
  ADD r15, r15, r11
  LDI r30, 0x880088
  STORE r15, r30
  ADD r15, r15, r11
  LDI r30, 0x00AAFF
  STORE r15, r30
  ADD r15, r15, r11
main_0:
  IKEY r3
  CMPI r3, 128
  JNZ r3, key_1
  IKEY r2
  CMPI r2, 128
  JNZ r2, key_2
  SHLI r11, r13, 2
  SHLI r6, r14, 4
  OR r15, r16, r9
  OR r15, r4, r9
  OR r3, r11, r6
  XOR r13, r11, r4
  FRAME
  JMP main_0
