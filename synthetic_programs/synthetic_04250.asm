; drawing loop program
; initialization
  LDI r2, 1374
  LDI r24, 10
  LDI r7, 0x31AABB
  LDI r9, 0x2D68D1
; palette
  LDI r6, 0x2087
  LDI r8, 1
  LDI r1, 0x888800
  STORE r6, r1
  ADD r6, r6, r8
  LDI r1, 0x00FF44
  STORE r6, r1
  ADD r6, r6, r8
  LDI r1, 0x8800FF
  STORE r6, r1
  ADD r6, r6, r8
  LDI r1, 0x880088
  STORE r6, r1
  ADD r6, r6, r8
  LDI r1, 0x00FFFF
  STORE r6, r1
  ADD r6, r6, r8
  LDI r1, 0xDD0044
  STORE r6, r1
  ADD r6, r6, r8
  LDI r1, 0xDD0044
  STORE r6, r1
  ADD r6, r6, r8
  LDI r1, 0x880088
  STORE r6, r1
  ADD r6, r6, r8
  LDI r1, 0xFFEE00
  STORE r6, r1
  ADD r6, r6, r8
  LDI r1, 0xFFAA00
  STORE r6, r1
  ADD r6, r6, r8
  LDI r1, 0x880088
  STORE r6, r1
  ADD r6, r6, r8
  LDI r1, 0x444444
  STORE r6, r1
  ADD r6, r6, r8
  LDI r1, 0x8800FF
  STORE r6, r1
  ADD r6, r6, r8
main_0:
  LDI r6, 2499
  LDI r15, 0x203AF4
  LDI r10, 61
  PSETI
  SUB r11, r0, r31
  LDI r15, 0xA9666F
  LDI r13, 0
  LDI r6, 0x2E9889
  TEXT r15, r13, r6, "HELLO"
  DIV r8, r2, r7
  FRAME
  JMP main_0
