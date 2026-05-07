; drawing loop program
; initialization
  LDI r7, 861
  LDI r19, 0x4AD726
  LDI r2, 3344
; palette
  LDI r5, 0x2189
  LDI r14, 1
  LDI r0, 0xFF00FF
  STORE r5, r0
  ADD r5, r5, r14
  LDI r0, 0xFFFF00
  STORE r5, r0
  ADD r5, r5, r14
  LDI r0, 0x880088
  STORE r5, r0
  ADD r5, r5, r14
  LDI r0, 0x000000
  STORE r5, r0
  ADD r5, r5, r14
  LDI r0, 0x880088
  STORE r5, r0
  ADD r5, r5, r14
  LDI r0, 0x0000FF
  STORE r5, r0
  ADD r5, r5, r14
  LDI r0, 0xFF0000
  STORE r5, r0
  ADD r5, r5, r14
  LDI r0, 0x550077
  STORE r5, r0
  ADD r5, r5, r14
main_0:
  XOR r0, r9, r3
  AND r13, r28, r7
  XOR r13, r8, r15
  LDI r3, 3477
  LDI r7, 374
  LDI r5, 64
  LDI r14, 256
  CIRCLE r3, r7, r5, r14
  FRAME
  JMP main_0
