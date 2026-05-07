; drawing loop program
; initialization
  LDI r14, 834
  LDI r7, 10
  LDI r9, 0xCEED44
  LDI r11, 3157
; palette
  LDI r3, 0x7009
  LDI r15, 1
  LDI r8, 0xAAFF00
  STORE r3, r8
  ADD r3, r3, r15
  LDI r8, 0x888800
  STORE r3, r8
  ADD r3, r3, r15
  LDI r8, 0x000000
  STORE r3, r8
  ADD r3, r3, r15
  LDI r8, 0x008888
  STORE r3, r8
  ADD r3, r3, r15
  LDI r8, 0x000000
  STORE r3, r8
  ADD r3, r3, r15
  LDI r8, 0xAA00AA
  STORE r3, r8
  ADD r3, r3, r15
  LDI r8, 0x550077
  STORE r3, r8
  ADD r3, r3, r15
  LDI r8, 0xFF00FF
  STORE r3, r8
  ADD r3, r3, r15
  LDI r8, 0xFF4400
  STORE r3, r8
  ADD r3, r3, r15
  LDI r8, 0x000066
  STORE r3, r8
  ADD r3, r3, r15
  LDI r8, 0x00FF44
  STORE r3, r8
  ADD r3, r3, r15
  LDI r8, 0xFFAA00
  STORE r3, r8
  ADD r3, r3, r15
  LDI r8, 0x000066
  STORE r3, r8
  ADD r3, r3, r15
  LDI r8, 0x00FF44
  STORE r3, r8
  ADD r3, r3, r15
main_0:
  LDI r3, 256
  LDI r1, 1376
  LDI r8, 1
  LDI r8, 0x7C7E94
  LDI r10, 256
  LINE r3, r1, r8, r8, r10
  LDI r2, 0xC34E5C
  LDI r8, 0x5B4ED8
  LDI r11, 0xC4B265
  TEXT r2, r8, r11, "HELLO"
  OR r4, r0, r28
  XOR r11, r0, r1
  SHR r14, r2, r22
  IKEY r0
  CMPI r0, 193
  JNZ r0, key_1
  FRAME
  JMP main_0
