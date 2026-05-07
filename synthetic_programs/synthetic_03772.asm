; drawing loop program
; initialization
  LDI r12, 8
  LDI r13, 0xC26C69
  LDI r10, 0xAB873A
  LDI r14, 0
; palette
  LDI r14, 0x3052
  LDI r8, 1
  LDI r4, 0xFFFFFF
  STORE r14, r4
  ADD r14, r14, r8
  LDI r4, 0x0000FF
  STORE r14, r4
  ADD r14, r14, r8
  LDI r4, 0xFFAA00
  STORE r14, r4
  ADD r14, r14, r8
  LDI r4, 0xFF00FF
  STORE r14, r4
  ADD r14, r14, r8
  LDI r4, 0xAA00AA
  STORE r14, r4
  ADD r14, r14, r8
  LDI r4, 0xAA00AA
  STORE r14, r4
  ADD r14, r14, r8
  LDI r4, 0xFF0000
  STORE r14, r4
  ADD r14, r14, r8
  LDI r4, 0x00FFFF
  STORE r14, r4
  ADD r14, r14, r8
  LDI r4, 0xFF4400
  STORE r14, r4
  ADD r14, r14, r8
  LDI r4, 0x0044FF
  STORE r14, r4
  ADD r14, r14, r8
  LDI r4, 0xFFEE00
  STORE r14, r4
  ADD r14, r14, r8
main_0:
  SHL r9, r3, r0
  SHLI r10, r4, 64
  SHLI r1, r15, 8
  IKEY r13
  CMPI r13, 0
  JNZ r13, key_1
  FRAME
  JMP main_0
