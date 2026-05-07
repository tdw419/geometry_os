; drawing loop program
; initialization
  LDI r2, 4
  LDI r31, 3206
; palette
  LDI r12, 0x80FE
  LDI r2, 1
  LDI r21, 0x550077
  STORE r12, r21
  ADD r12, r12, r2
  LDI r21, 0xAAFF00
  STORE r12, r21
  ADD r12, r12, r2
  LDI r21, 0x00FFAA
  STORE r12, r21
  ADD r12, r12, r2
  LDI r21, 0x000000
  STORE r12, r21
  ADD r12, r12, r2
  LDI r21, 0x00FFAA
  STORE r12, r21
  ADD r12, r12, r2
  LDI r21, 0xFF4400
  STORE r12, r21
  ADD r12, r12, r2
  LDI r21, 0x00FF00
  STORE r12, r21
  ADD r12, r12, r2
  LDI r21, 0x00AAFF
  STORE r12, r21
  ADD r12, r12, r2
  LDI r21, 0xFFEE00
  STORE r12, r21
  ADD r12, r12, r2
  LDI r21, 0x00FF00
  STORE r12, r21
  ADD r12, r12, r2
  LDI r21, 0xAAFF00
  STORE r12, r21
  ADD r12, r12, r2
  LDI r21, 0xDD0044
  STORE r12, r21
  ADD r12, r12, r2
  LDI r21, 0x880088
  STORE r12, r21
  ADD r12, r12, r2
main_0:
  LDI r2, 3821
  LDI r8, 162
  LDI r3, 255
  PSET r2, r8, r3
  ADDI r9, r13, 129
  FRAME
  JMP main_0
