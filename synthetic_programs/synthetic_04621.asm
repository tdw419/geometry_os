; drawing loop program
; initialization
  LDI r16, 255
  LDI r1, 0xCE2471
  LDI r2, 3854
  LDI r13, 2
  LDI r4, 64
  LDI r12, 64
; palette
  LDI r5, 0x508E
  LDI r6, 1
  LDI r3, 0xFFAA00
  STORE r5, r3
  ADD r5, r5, r6
  LDI r3, 0x00FF44
  STORE r5, r3
  ADD r5, r5, r6
  LDI r3, 0x8800FF
  STORE r5, r3
  ADD r5, r5, r6
  LDI r3, 0x0044FF
  STORE r5, r3
  ADD r5, r5, r6
  LDI r3, 0xFFAA00
  STORE r5, r3
  ADD r5, r5, r6
  LDI r3, 0xFF4400
  STORE r5, r3
  ADD r5, r5, r6
  LDI r3, 0x0044FF
  STORE r5, r3
  ADD r5, r5, r6
main_0:
  SHLI r4, r10, 2
  SHL r0, r15, r5
  SHLI r0, r6, 0xEA925D
  SAR r8, r15, r6
  SHR r13, r29, r6
  FRAME
  JMP main_0
