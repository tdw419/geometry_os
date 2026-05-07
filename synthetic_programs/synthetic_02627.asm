; drawing loop program
; initialization
  LDI r18, 250
  LDI r3, 1054
  LDI r7, 128
  LDI r6, 0xFA8B83
  LDI r15, 0xC8C88B
  LDI r2, 3325
  LDI r9, 822
  LDI r13, 2
; palette
  LDI r13, 0x6021
  LDI r8, 1
  LDI r5, 0x44FF00
  STORE r13, r5
  ADD r13, r13, r8
  LDI r5, 0x550077
  STORE r13, r5
  ADD r13, r13, r8
  LDI r5, 0x0000CC
  STORE r13, r5
  ADD r13, r13, r8
  LDI r5, 0xAAFF00
  STORE r13, r5
  ADD r13, r13, r8
  LDI r5, 0xFFFFFF
  STORE r13, r5
  ADD r13, r13, r8
  LDI r5, 0x8800FF
  STORE r13, r5
  ADD r13, r13, r8
  LDI r5, 0x00AAFF
  STORE r13, r5
  ADD r13, r13, r8
  LDI r5, 0x00FF00
  STORE r13, r5
  ADD r13, r13, r8
  LDI r5, 0xFFAA00
  STORE r13, r5
  ADD r13, r13, r8
  LDI r5, 0x888800
  STORE r13, r5
  ADD r13, r13, r8
  LDI r5, 0x44FF00
  STORE r13, r5
  ADD r13, r13, r8
  LDI r5, 0x444444
  STORE r13, r5
  ADD r13, r13, r8
  LDI r5, 0x00AAFF
  STORE r13, r5
  ADD r13, r13, r8
main_0:
  OR r2, r8, r0
  OR r6, r25, r12
  OR r15, r5, r3
  XOR r10, r12, r4
  XOR r0, r9, r4
  AND r1, r6, r5
  FRAME
  JMP main_0
