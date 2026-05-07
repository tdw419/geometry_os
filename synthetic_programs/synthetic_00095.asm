; mixed program
; initialization
  LDI r2, 3861
  LDI r8, 371
  LDI r7, 0x04BF8E
  LDI r4, 0xF08B4A
  LDI r1, 256
  LDI r11, 3434
  LDI r5, 1330
; palette
  LDI r12, 0x20A9
  LDI r8, 1
  LDI r0, 0x0000CC
  STORE r12, r0
  ADD r12, r12, r8
  LDI r0, 0x0044FF
  STORE r12, r0
  ADD r12, r12, r8
  LDI r0, 0xFFFFFF
  STORE r12, r0
  ADD r12, r12, r8
  LDI r0, 0xFF4400
  STORE r12, r0
  ADD r12, r12, r8
  SHLI r5, r0, 16
  SHL r15, r13, r14
  CMPI r0, 8
  CMP r3, r6
  CMP r4, r2
  HALT
