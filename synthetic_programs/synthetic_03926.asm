; drawing loop program
; initialization
  LDI r2, 255
  LDI r4, 0x523EB3
  LDI r3, 181
; palette
  LDI r3, 0x23E8
  LDI r8, 1
  LDI r2, 0x444444
  STORE r3, r2
  ADD r3, r3, r8
  LDI r2, 0x0044FF
  STORE r3, r2
  ADD r3, r3, r8
  LDI r2, 0xFF8800
  STORE r3, r2
  ADD r3, r3, r8
  LDI r2, 0xAAFF00
  STORE r3, r2
  ADD r3, r3, r8
  LDI r2, 0x444444
  STORE r3, r2
  ADD r3, r3, r8
  LDI r2, 0x00FF00
  STORE r3, r2
  ADD r3, r3, r8
main_0:
  MUL r8, r11, r10
  SHL r7, r0, r1
  SHLI r14, r10, 0x6E5CA5
  SHLI r6, r11, 0x75077E
  CMPI r11, r3, 0x3CF300
  IKEY r11
  CMPI r11, 241
  JNZ r11, key_1
  FRAME
  JMP main_0
