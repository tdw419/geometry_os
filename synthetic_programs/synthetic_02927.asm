; drawing loop program
; initialization
  LDI r14, 0x879993
  LDI r31, 3425
  LDI r8, 64
  LDI r5, 0xF01C98
; palette
  LDI r8, 0x218C
  LDI r13, 1
  LDI r3, 0x00FFAA
  STORE r8, r3
  ADD r8, r8, r13
  LDI r3, 0x550077
  STORE r8, r3
  ADD r8, r8, r13
  LDI r3, 0x00FF00
  STORE r8, r3
  ADD r8, r8, r13
  LDI r3, 0xFFEE00
  STORE r8, r3
  ADD r8, r8, r13
  LDI r3, 0xFFEE00
  STORE r8, r3
  ADD r8, r8, r13
main_0:
  CMP r4, r13
  SHL r13, r4, r3
  SHLI r15, r4, 0
  ADD r1, r4, r9
  CMPI r13, r3, 154
  CMPI r10, 202
  FRAME
  JMP main_0
