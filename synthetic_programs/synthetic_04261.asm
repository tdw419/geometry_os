; drawing loop program
; initialization
  LDI r7, 64
  LDI r2, 3075
  LDI r15, 2432
  LDI r8, 2770
; palette
  LDI r10, 0x240A
  LDI r8, 1
  LDI r12, 0x444444
  STORE r10, r12
  ADD r10, r10, r8
  LDI r12, 0x000000
  STORE r10, r12
  ADD r10, r10, r8
  LDI r12, 0xFFAA00
  STORE r10, r12
  ADD r10, r10, r8
  LDI r12, 0xFFFFFF
  STORE r10, r12
  ADD r10, r10, r8
  LDI r12, 0x0044FF
  STORE r10, r12
  ADD r10, r10, r8
  LDI r12, 0x00FF00
  STORE r10, r12
  ADD r10, r10, r8
main_0:
  MOD r5, r1, r14
  MUL r4, r0, r3
  LDI r3, 1803
  LDI r10, 0x687CBC
  LDI r16, 8
  WPIXEL
  CMPI r0, 0x946334
  CMP r8, r1
  FRAME
  JMP main_0
