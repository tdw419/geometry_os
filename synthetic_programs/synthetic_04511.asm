; drawing loop program
; initialization
  LDI r9, 128
  LDI r15, 1220
  LDI r7, 256
  LDI r1, 2322
  LDI r2, 0xD11321
; palette
  LDI r11, 0x22F9
  LDI r14, 1
  LDI r2, 0xAAFF00
  STORE r11, r2
  ADD r11, r11, r14
  LDI r2, 0x0044FF
  STORE r11, r2
  ADD r11, r11, r14
  LDI r2, 0x444444
  STORE r11, r2
  ADD r11, r11, r14
  LDI r2, 0xAA00AA
  STORE r11, r2
  ADD r11, r11, r14
  LDI r2, 0x0044FF
  STORE r11, r2
  ADD r11, r11, r14
  LDI r2, 0xFFAA00
  STORE r11, r2
  ADD r11, r11, r14
  LDI r2, 0x0044FF
  STORE r11, r2
  ADD r11, r11, r14
main_0:
  IKEY r13
  CMPI r13, 16
  JNZ r13, key_1
  AND r3, r7, r8
  XOR r0, r7, r13
  FRAME
  JMP main_0
