; mixed program
; initialization
  LDI r2, 64
  LDI r6, 1
  LDI r13, 1259
; palette
  LDI r1, 0x24D0
  LDI r8, 1
  LDI r7, 0xAAAAAA
  STORE r1, r7
  ADD r1, r1, r8
  LDI r7, 0xAAFF00
  STORE r1, r7
  ADD r1, r1, r8
  LDI r7, 0x880088
  STORE r1, r7
  ADD r1, r1, r8
  LDI r7, 0x444444
  STORE r1, r7
  ADD r1, r1, r8
  LDI r7, 0x008888
  STORE r1, r7
  ADD r1, r1, r8
  LDI r7, 0x000000
  STORE r1, r7
  ADD r1, r1, r8
  LDI r7, 0x880088
  STORE r1, r7
  ADD r1, r1, r8
  LDI r7, 0xFFEE00
  STORE r1, r7
  ADD r1, r1, r8
  LDI r7, 0x00FF00
  STORE r1, r7
  ADD r1, r1, r8
  LDI r7, 0x00FFAA
  STORE r1, r7
  ADD r1, r1, r8
  IKEY r2
  CMPI r2, 37
  JNZ r2, key_0
  LDI r9, 32
  STORE r9, r4
  LOAD r20, r9
  LDI r11, 64
  STORE r11, r2
  LOAD r4, r11
  CMP r8, r5
  HALT
