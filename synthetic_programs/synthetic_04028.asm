; drawing loop program
; initialization
  LDI r2, 0xE01ACC
  LDI r9, 1
  LDI r6, 383
  LDI r8, 2815
  LDI r0, 0xE4C4E9
  LDI r12, 576
  LDI r13, 2773
  LDI r4, 0x8C9B85
; palette
  LDI r1, 0x2258
  LDI r13, 1
  LDI r14, 0x880088
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0x00FFAA
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0xFFFF00
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0x00FFAA
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0xFFAA00
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0x00FF44
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0x0000FF
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0xFFAA00
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0x880088
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0x00FF00
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0xAAFF00
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0x00FFFF
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0x0044FF
  STORE r1, r14
  ADD r1, r1, r13
main_0:
  XOR r9, r15, r12
  AND r5, r8, r9
  AND r5, r11, r1
  SHL r9, r10, r0
  SHLI r30, r10, 1
  SHL r22, r4, r6
  ANDI r10, r12, 143
  FRAME
  JMP main_0
