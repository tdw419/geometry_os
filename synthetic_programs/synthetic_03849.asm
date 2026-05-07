; drawing loop program
; initialization
  LDI r12, 592
  LDI r1, 0xC46C1F
  LDI r6, 1277
  LDI r5, 2459
  LDI r7, 2
  LDI r14, 0xE6C530
; palette
  LDI r14, 0x50C2
  LDI r0, 1
  LDI r10, 0x00FF00
  STORE r14, r10
  ADD r14, r14, r0
  LDI r10, 0x000000
  STORE r14, r10
  ADD r14, r14, r0
  LDI r10, 0x0000FF
  STORE r14, r10
  ADD r14, r14, r0
  LDI r10, 0x00FFAA
  STORE r14, r10
  ADD r14, r14, r0
  LDI r10, 0x888800
  STORE r14, r10
  ADD r14, r14, r0
  LDI r10, 0xFFAA00
  STORE r14, r10
  ADD r14, r14, r0
  LDI r10, 0x000066
  STORE r14, r10
  ADD r14, r14, r0
  LDI r10, 0x0044FF
  STORE r14, r10
  ADD r14, r14, r0
  LDI r10, 0xFF00FF
  STORE r14, r10
  ADD r14, r14, r0
main_0:
  IKEY r3
  CMPI r3, 1
  JNZ r3, key_1
  XOR r8, r1, r6
  XOR r10, r7, r15
  FRAME
  JMP main_0
