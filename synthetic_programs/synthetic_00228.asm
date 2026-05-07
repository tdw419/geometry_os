; drawing loop program
; initialization
  LDI r14, 0x0CE088
  LDI r6, 8
  LDI r15, 2915
  LDI r13, 756
  LDI r1, 1071
; palette
  LDI r4, 0x2341
  LDI r8, 1
  LDI r13, 0x0000CC
  STORE r4, r13
  ADD r4, r4, r8
  LDI r13, 0x8800FF
  STORE r4, r13
  ADD r4, r4, r8
  LDI r13, 0x00FF44
  STORE r4, r13
  ADD r4, r4, r8
  LDI r13, 0x000066
  STORE r4, r13
  ADD r4, r4, r8
  LDI r13, 0xFFFFFF
  STORE r4, r13
  ADD r4, r4, r8
  LDI r13, 0x0044FF
  STORE r4, r13
  ADD r4, r4, r8
  LDI r13, 0xFF00FF
  STORE r4, r13
  ADD r4, r4, r8
  LDI r13, 0xFF00FF
  STORE r4, r13
  ADD r4, r4, r8
  LDI r13, 0x00FF00
  STORE r4, r13
  ADD r4, r4, r8
  LDI r13, 0xFFFF00
  STORE r4, r13
  ADD r4, r4, r8
  LDI r13, 0xFFFF00
  STORE r4, r13
  ADD r4, r4, r8
main_0:
  IKEY r10
  CMPI r10, 0x14F858
  JNZ r10, key_1
  LDI r14, 0x3C3DD9
  LDI r22, 2536
  LDI r15, 0xEB07A1
  TEXT r14, r22, r15, "HELLO"
  CMPI r11, r0, 256
  FRAME
  JMP main_0
