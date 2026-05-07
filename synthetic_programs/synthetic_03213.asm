; mixed program
; initialization
  LDI r10, 0x50FE8E
  LDI r20, 4
  LDI r14, 0xC3CE2D
  LDI r4, 1843
  LDI r11, 3134
; palette
  LDI r1, 0x23EF
  LDI r9, 1
  LDI r7, 0x00FF44
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x44FF00
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0xFF4400
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x00FF44
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x00FFAA
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x00AAFF
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x888800
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x8800FF
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x0044FF
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x00FFFF
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x0044FF
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x0000FF
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x0000CC
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x00FF44
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x44FF00
  STORE r1, r7
  ADD r1, r1, r9
  LDI r7, 0x00AAFF
  STORE r1, r7
  ADD r1, r1, r9
  LDI r10, 1708
  FILL r10
  PUSH r12
  OR r5, r6, r25
  SHR r8, r0, r2
  POP r12
  OR r5, r13, r10
  OR r4, r14, r8
  OR r3, r7, r9
  HALT
