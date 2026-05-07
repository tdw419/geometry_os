; drawing loop program
; initialization
  LDI r26, 0xAD05D3
  LDI r7, 3800
  LDI r1, 0x2F56F7
  LDI r14, 0
; palette
  LDI r19, 0x800D
  LDI r2, 1
  LDI r3, 0xFFFFFF
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0x44FF00
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0x00FF44
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0xFF00FF
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0xAAFF00
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0x000066
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0x0044FF
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0xFFAA00
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0xDD0044
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0x0044FF
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0xFF00FF
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0xFFEE00
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0x008888
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0xFF8800
  STORE r19, r3
  ADD r19, r19, r2
  LDI r3, 0x00FF44
  STORE r19, r3
  ADD r19, r19, r2
main_0:
  IKEY r6
  CMPI r6, 87
  JNZ r6, key_1
  SHLI r7, r13, 4
  SHL r8, r14, r13
  SHLI r15, r14, 0x1CF5D7
  FRAME
  JMP main_0
