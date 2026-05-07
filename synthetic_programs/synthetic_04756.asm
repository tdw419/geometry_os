; drawing loop program
; initialization
  LDI r8, 0x2D4D4F
  LDI r13, 32
  LDI r5, 0x2256AA
; palette
  LDI r2, 0x70CC
  LDI r5, 1
  LDI r10, 0x00FF00
  STORE r2, r10
  ADD r2, r2, r5
  LDI r10, 0x8800FF
  STORE r2, r10
  ADD r2, r2, r5
  LDI r10, 0x880088
  STORE r2, r10
  ADD r2, r2, r5
  LDI r10, 0x44FF00
  STORE r2, r10
  ADD r2, r2, r5
  LDI r10, 0x000066
  STORE r2, r10
  ADD r2, r2, r5
  LDI r10, 0xFFFFFF
  STORE r2, r10
  ADD r2, r2, r5
  LDI r10, 0x0044FF
  STORE r2, r10
  ADD r2, r2, r5
  LDI r10, 0x880088
  STORE r2, r10
  ADD r2, r2, r5
  LDI r10, 0x008888
  STORE r2, r10
  ADD r2, r2, r5
  LDI r10, 0xFFEE00
  STORE r2, r10
  ADD r2, r2, r5
  LDI r10, 0x0000FF
  STORE r2, r10
  ADD r2, r2, r5
main_0:
  CMPI r11, 94
  LDI r8, 4
  LDI r6, 3247
  LDI r10, 3137
  TEXT r8, r6, r10, "HELLO"
  FRAME
  JMP main_0
