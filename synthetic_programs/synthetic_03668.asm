; drawing loop program
; initialization
  LDI r4, 1
  LDI r2, 3614
  LDI r1, 982
  LDI r3, 32
  LDI r6, 256
  LDI r9, 32
  LDI r8, 2190
  LDI r18, 64
; palette
  LDI r8, 0x6044
  LDI r5, 1
  LDI r4, 0x888800
  STORE r8, r4
  ADD r8, r8, r5
  LDI r4, 0xFFEE00
  STORE r8, r4
  ADD r8, r8, r5
  LDI r4, 0xFFEE00
  STORE r8, r4
  ADD r8, r8, r5
  LDI r4, 0xFFEE00
  STORE r8, r4
  ADD r8, r8, r5
  LDI r4, 0xFFAA00
  STORE r8, r4
  ADD r8, r8, r5
  LDI r4, 0xFF0000
  STORE r8, r4
  ADD r8, r8, r5
  LDI r4, 0xAAFF00
  STORE r8, r4
  ADD r8, r8, r5
  LDI r4, 0xAA00AA
  STORE r8, r4
  ADD r8, r8, r5
  LDI r4, 0x44FF00
  STORE r8, r4
  ADD r8, r8, r5
  LDI r4, 0xFFAA00
  STORE r8, r4
  ADD r8, r8, r5
main_0:
  LDI r6, 0
  LDI r12, 3380
  LDI r9, 0x367D6C
  TEXT r6, r12, r9, "HELLO"
  SUB r0, r3, r6
  FRAME
  JMP main_0
