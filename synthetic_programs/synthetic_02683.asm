; drawing loop program
; initialization
  LDI r10, 64
  LDI r14, 10
; palette
  LDI r13, 0x2078
  LDI r14, 1
  LDI r4, 0xFFEE00
  STORE r13, r4
  ADD r13, r13, r14
  LDI r4, 0x0000CC
  STORE r13, r4
  ADD r13, r13, r14
  LDI r4, 0xFF4400
  STORE r13, r4
  ADD r13, r13, r14
  LDI r4, 0x888800
  STORE r13, r4
  ADD r13, r13, r14
  LDI r4, 0x0000FF
  STORE r13, r4
  ADD r13, r13, r14
  LDI r4, 0x444444
  STORE r13, r4
  ADD r13, r13, r14
  LDI r4, 0xFF0000
  STORE r13, r4
  ADD r13, r13, r14
  LDI r4, 0x550077
  STORE r13, r4
  ADD r13, r13, r14
  LDI r4, 0xFFEE00
  STORE r13, r4
  ADD r13, r13, r14
  LDI r4, 0xFFEE00
  STORE r13, r4
  ADD r13, r13, r14
  LDI r4, 0x444444
  STORE r13, r4
  ADD r13, r13, r14
  LDI r4, 0x000000
  STORE r13, r4
  ADD r13, r13, r14
  LDI r4, 0x888800
  STORE r13, r4
  ADD r13, r13, r14
main_0:
  SHR r3, r0, r13
  SHLI r5, r12, 8
  SAR r10, r8, r9
  SHLI r0, r6, 5
  SUBI r8, r12, 2
  FRAME
  JMP main_0
