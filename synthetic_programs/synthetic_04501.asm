; drawing loop program
; initialization
  LDI r6, 1452
  LDI r8, 32
; palette
  LDI r12, 0x50E2
  LDI r3, 1
  LDI r2, 0x000066
  STORE r12, r2
  ADD r12, r12, r3
  LDI r2, 0xAAFF00
  STORE r12, r2
  ADD r12, r12, r3
  LDI r2, 0x0044FF
  STORE r12, r2
  ADD r12, r12, r3
  LDI r2, 0x880088
  STORE r12, r2
  ADD r12, r12, r3
  LDI r2, 0x550077
  STORE r12, r2
  ADD r12, r12, r3
  LDI r2, 0xAAAAAA
  STORE r12, r2
  ADD r12, r12, r3
  LDI r2, 0xFF4400
  STORE r12, r2
  ADD r12, r12, r3
  LDI r2, 0x0000CC
  STORE r12, r2
  ADD r12, r12, r3
  LDI r2, 0x880088
  STORE r12, r2
  ADD r12, r12, r3
  LDI r2, 0x8800FF
  STORE r12, r2
  ADD r12, r12, r3
  LDI r2, 0xFF4400
  STORE r12, r2
  ADD r12, r12, r3
  LDI r2, 0x0000FF
  STORE r12, r2
  ADD r12, r12, r3
  LDI r2, 0x44FF00
  STORE r12, r2
  ADD r12, r12, r3
main_0:
  SHLI r8, r4, 1
  SHL r14, r15, r7
  LDI r3, 1433
  LDI r8, 479
  LDI r9, 4
  LDI r21, 4086
  LDI r14, 0x09CB0E
  RECTF r3, r8, r9, r21, r14
  FRAME
  JMP main_0
