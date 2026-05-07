; drawing loop program
; initialization
  LDI r2, 10
  LDI r0, 2
  LDI r8, 0x5DE433
  LDI r14, 0x202F76
  LDI r9, 1903
; palette
  LDI r5, 0x30CB
  LDI r10, 1
  LDI r6, 0x880088
  STORE r5, r6
  ADD r5, r5, r10
  LDI r6, 0x880088
  STORE r5, r6
  ADD r5, r5, r10
  LDI r6, 0xFFEE00
  STORE r5, r6
  ADD r5, r5, r10
  LDI r6, 0x880088
  STORE r5, r6
  ADD r5, r5, r10
  LDI r6, 0x550077
  STORE r5, r6
  ADD r5, r5, r10
  LDI r6, 0x000066
  STORE r5, r6
  ADD r5, r5, r10
  LDI r6, 0x008888
  STORE r5, r6
  ADD r5, r5, r10
  LDI r6, 0x550077
  STORE r5, r6
  ADD r5, r5, r10
  LDI r6, 0x00FF00
  STORE r5, r6
  ADD r5, r5, r10
  LDI r6, 0x888800
  STORE r5, r6
  ADD r5, r5, r10
main_0:
  AND r0, r5, r1
  XOR r4, r8, r6
  AND r7, r13, r6
  AND r5, r1, r4
  LDI r12, 3839
  LDI r8, 0
  LDI r0, 3493
  DRAWTEXT r12, r8, r0, "WORLD"
  CMPI r10, r0, 80
  FRAME
  JMP main_0
