; drawing loop program
; initialization
  LDI r14, 563
  LDI r8, 0xB24109
  LDI r1, 2642
  LDI r9, 2639
  LDI r15, 4081
  LDI r4, 0xAA1557
; palette
  LDI r14, 0x3005
  LDI r10, 1
  LDI r4, 0xFFAA00
  STORE r14, r4
  ADD r14, r14, r10
  LDI r4, 0x00FFFF
  STORE r14, r4
  ADD r14, r14, r10
  LDI r4, 0xFF8800
  STORE r14, r4
  ADD r14, r14, r10
  LDI r4, 0xFF4400
  STORE r14, r4
  ADD r14, r14, r10
  LDI r4, 0x00FF44
  STORE r14, r4
  ADD r14, r14, r10
  LDI r4, 0x00FF00
  STORE r14, r4
  ADD r14, r14, r10
  LDI r4, 0x0044FF
  STORE r14, r4
  ADD r14, r14, r10
main_0:
  LDI r13, 64
  LDI r10, 64
  LDI r31, 8
  TEXT r13, r10, r31, "HELLO"
  SHR r15, r10, r7
  SHLI r4, r10, 7
  FRAME
  JMP main_0
