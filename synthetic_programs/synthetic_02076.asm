; drawing loop program
; initialization
  LDI r10, 1022
  LDI r2, 3127
  LDI r5, 0
  LDI r1, 0x504F6B
  LDI r6, 0x1AAE30
  LDI r11, 32
  LDI r3, 1623
  LDI r13, 256
; palette
  LDI r5, 0x209E
  LDI r0, 1
  LDI r10, 0x8800FF
  STORE r5, r10
  ADD r5, r5, r0
  LDI r10, 0xFF0000
  STORE r5, r10
  ADD r5, r5, r0
  LDI r10, 0x0044FF
  STORE r5, r10
  ADD r5, r5, r0
  LDI r10, 0x880088
  STORE r5, r10
  ADD r5, r5, r0
  LDI r10, 0x008888
  STORE r5, r10
  ADD r5, r5, r0
  LDI r10, 0x888800
  STORE r5, r10
  ADD r5, r5, r0
  LDI r10, 0x000000
  STORE r5, r10
  ADD r5, r5, r0
  LDI r10, 0x000066
  STORE r5, r10
  ADD r5, r5, r0
  LDI r10, 0x00FF44
  STORE r5, r10
  ADD r5, r5, r0
  LDI r10, 0xFFEE00
  STORE r5, r10
  ADD r5, r5, r0
  LDI r10, 0x00FFFF
  STORE r5, r10
  ADD r5, r5, r0
  LDI r10, 0xAAFF00
  STORE r5, r10
  ADD r5, r5, r0
  LDI r10, 0x00FFFF
  STORE r5, r10
  ADD r5, r5, r0
  LDI r10, 0x44FF00
  STORE r5, r10
  ADD r5, r5, r0
main_0:
  LDI r0, 3421
  LDI r14, 1759
  LDI r14, 4
  TEXT r0, r14, r14, "HELLO"
  IKEY r12
  CMPI r12, 0xF2DF5E
  JNZ r12, key_1
  FRAME
  JMP main_0
