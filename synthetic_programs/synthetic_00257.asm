; drawing loop program
; initialization
  LDI r6, 1044
  LDI r5, 2
  LDI r27, 0x324A25
  LDI r8, 4
  LDI r13, 0xA93F7A
  LDI r9, 4
  LDI r2, 355
; palette
  LDI r3, 0x70B9
  LDI r14, 1
  LDI r7, 0xAAAAAA
  STORE r3, r7
  ADD r3, r3, r14
  LDI r7, 0xFFEE00
  STORE r3, r7
  ADD r3, r3, r14
  LDI r7, 0x0044FF
  STORE r3, r7
  ADD r3, r3, r14
  LDI r7, 0xFF0000
  STORE r3, r7
  ADD r3, r3, r14
  LDI r7, 0x8800FF
  STORE r3, r7
  ADD r3, r3, r14
  LDI r7, 0xAA00AA
  STORE r3, r7
  ADD r3, r3, r14
  LDI r7, 0xFFFF00
  STORE r3, r7
  ADD r3, r3, r14
  LDI r7, 0xFF0000
  STORE r3, r7
  ADD r3, r3, r14
  LDI r7, 0xAA00AA
  STORE r3, r7
  ADD r3, r3, r14
main_0:
  SUBI r17, r12, 166
  ADD r8, r6, r9
  FRAME
  JMP main_0
