; drawing loop program
; initialization
  LDI r5, 320
  LDI r2, 128
  LDI r12, 58
  LDI r9, 0x480D98
  LDI r30, 64
  LDI r13, 8
  LDI r11, 0x1F4E44
  LDI r14, 2207
; palette
  LDI r3, 0x809E
  LDI r7, 1
  LDI r2, 0x444444
  STORE r3, r2
  ADD r3, r3, r7
  LDI r2, 0xDD0044
  STORE r3, r2
  ADD r3, r3, r7
  LDI r2, 0xAAAAAA
  STORE r3, r2
  ADD r3, r3, r7
  LDI r2, 0x0000CC
  STORE r3, r2
  ADD r3, r3, r7
  LDI r2, 0xFF0000
  STORE r3, r2
  ADD r3, r3, r7
  LDI r2, 0x44FF00
  STORE r3, r2
  ADD r3, r3, r7
  LDI r2, 0x0044FF
  STORE r3, r2
  ADD r3, r3, r7
  LDI r2, 0xFFEE00
  STORE r3, r2
  ADD r3, r3, r7
  LDI r2, 0x550077
  STORE r3, r2
  ADD r3, r3, r7
  LDI r2, 0x880088
  STORE r3, r2
  ADD r3, r3, r7
main_0:
  SUBI r9, r12, 64
  LDI r8, 0xB3F60A
  FILL r8
  CMPI r4, 256
  IKEY r15
  CMPI r15, 0xAAF3B8
  JNZ r15, key_1
  SHL r15, r2, r1
  CMP r7, r3
  FRAME
  JMP main_0
