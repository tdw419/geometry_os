; drawing loop program
; initialization
  LDI r0, 1873
  LDI r8, 8
; palette
  LDI r14, 0x23B4
  LDI r2, 1
  LDI r10, 0x0000FF
  STORE r14, r10
  ADD r14, r14, r2
  LDI r10, 0x00FF44
  STORE r14, r10
  ADD r14, r14, r2
  LDI r10, 0x880088
  STORE r14, r10
  ADD r14, r14, r2
  LDI r10, 0x00FFAA
  STORE r14, r10
  ADD r14, r14, r2
  LDI r10, 0x00FFFF
  STORE r14, r10
  ADD r14, r14, r2
  LDI r10, 0x00FF00
  STORE r14, r10
  ADD r14, r14, r2
  LDI r10, 0xFF4400
  STORE r14, r10
  ADD r14, r14, r2
  LDI r10, 0xFFEE00
  STORE r14, r10
  ADD r14, r14, r2
  LDI r10, 0xFF0000
  STORE r14, r10
  ADD r14, r14, r2
main_0:
  CMPI r1, 16
  LDI r14, 0x1C9ACC
  LDI r12, 0x6E9921
  LDI r7, 16
  TEXT r14, r12, r7, "HELLO"
  FRAME
  JMP main_0
