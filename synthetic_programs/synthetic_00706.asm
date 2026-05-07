; drawing loop program
; initialization
  LDI r7, 0x7345C8
  LDI r15, 2193
  LDI r0, 1712
  LDI r4, 3143
  LDI r10, 0x481FAD
  LDI r8, 1303
; palette
  LDI r9, 0x700D
  LDI r2, 1
  LDI r13, 0xFFFFFF
  STORE r9, r13
  ADD r9, r9, r2
  LDI r13, 0xAAAAAA
  STORE r9, r13
  ADD r9, r9, r2
  LDI r13, 0x00FF44
  STORE r9, r13
  ADD r9, r9, r2
  LDI r13, 0xFF00FF
  STORE r9, r13
  ADD r9, r9, r2
  LDI r13, 0x00FF44
  STORE r9, r13
  ADD r9, r9, r2
  LDI r13, 0xFFEE00
  STORE r9, r13
  ADD r9, r9, r2
  LDI r13, 0xAA00AA
  STORE r9, r13
  ADD r9, r9, r2
  LDI r13, 0x880088
  STORE r9, r13
  ADD r9, r9, r2
  LDI r13, 0x00FF44
  STORE r9, r13
  ADD r9, r9, r2
  LDI r13, 0x0044FF
  STORE r9, r13
  ADD r9, r9, r2
  LDI r13, 0x0000CC
  STORE r9, r13
  ADD r9, r9, r2
  LDI r13, 0xAAFF00
  STORE r9, r13
  ADD r9, r9, r2
  LDI r13, 0x000000
  STORE r9, r13
  ADD r9, r9, r2
main_0:
  CMPI r0, 2
  XOR r13, r3, r5
  OR r9, r2, r13
  XOR r12, r22, r6
  AND r23, r5, r9
  CMPI r6, r7, 64
  CMPI r3, 0
  CMPI r5, r3, 19
  FRAME
  JMP main_0
