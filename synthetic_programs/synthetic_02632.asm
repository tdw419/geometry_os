; mixed program
; initialization
  LDI r9, 0xE0E98E
  LDI r1, 10
; palette
  LDI r1, 0x30C7
  LDI r13, 1
  LDI r2, 0x44FF00
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0xFFFFFF
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0x444444
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0x44FF00
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0x0000FF
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0xAAFF00
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0x0000FF
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0x00AAFF
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0xFF00FF
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0x44FF00
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0x00FF00
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0xFF8800
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0x8800FF
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0x008888
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0xFFEE00
  STORE r1, r2
  ADD r1, r1, r13
  LDI r2, 0xFF00FF
  STORE r1, r2
  ADD r1, r1, r13
  LDI r14, 0xA22513
  LDI r14, 32
  LDI r1, 4
  LDI r3, 0xC5EBD2
  CIRCLE r14, r14, r1, r3
  LDI r25, 2756
  STORE r25, r14
  LOAD r8, r25
  LDI r14, 2524
  STORE r14, r13
  LOAD r0, r14
  LDI r4, 1186
  STORE r4, r2
  LOAD r9, r4
  LDI r2, 0
  LDI r8, 0xA7F0A1
  LDI r14, 2163
  LDI r2, 1682
  LDI r5, 0x14FDAC
  RECTF r2, r8, r14, r2, r5
  HALT
