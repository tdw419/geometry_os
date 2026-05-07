; drawing loop program
; initialization
  LDI r14, 0x75ED48
  LDI r12, 0xE37255
  LDI r7, 8
  LDI r9, 255
  LDI r10, 255
  LDI r5, 4067
; palette
  LDI r14, 0x7097
  LDI r4, 1
  LDI r13, 0xFFAA00
  STORE r14, r13
  ADD r14, r14, r4
  LDI r13, 0x000000
  STORE r14, r13
  ADD r14, r14, r4
  LDI r13, 0x550077
  STORE r14, r13
  ADD r14, r14, r4
  LDI r13, 0xFFEE00
  STORE r14, r13
  ADD r14, r14, r4
  LDI r13, 0x008888
  STORE r14, r13
  ADD r14, r14, r4
  LDI r13, 0x0044FF
  STORE r14, r13
  ADD r14, r14, r4
main_0:
  SHLI r15, r22, 8
  SHL r3, r5, r14
  SHL r12, r10, r5
  LDI r2, 64
  LDI r10, 32
  LDI r9, 2550
  LDI r23, 2
  LDI r30, 2266
  LINE r2, r10, r9, r23, r30
  OR r4, r6, r14
  AND r7, r14, r9
  OR r9, r3, r12
  FRAME
  JMP main_0
