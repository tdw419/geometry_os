; drawing loop program
; initialization
  LDI r9, 3741
  LDI r8, 16
  LDI r18, 0xBF08FE
  LDI r7, 32
  LDI r0, 32
  LDI r12, 0
; palette
  LDI r5, 0x6021
  LDI r14, 1
  LDI r8, 0xFF00FF
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0x008888
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0x00FF44
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0x550077
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0xFF8800
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0xFFFFFF
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0x00FF00
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0xAA00AA
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0x550077
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0xFFFF00
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0xFFFFFF
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0x008888
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0x00FFFF
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0x880088
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0x0044FF
  STORE r5, r8
  ADD r5, r5, r14
  LDI r8, 0xFFAA00
  STORE r5, r8
  ADD r5, r5, r14
main_0:
  SHL r4, r0, r3
  SAR r0, r10, r2
  CMPI r4, 0xA4ACCD
  FRAME
  JMP main_0
