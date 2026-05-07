; drawing loop program
; initialization
  LDI r8, 2636
  LDI r7, 1024
  LDI r6, 1
  LDI r12, 0x14530A
  LDI r10, 4
; palette
  LDI r7, 0x302C
  LDI r10, 1
  LDI r5, 0xFF8800
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0xAAFF00
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0x00FF00
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0x000066
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0x8800FF
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0x000000
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0xDD0044
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0x880088
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0xFF8800
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0xAA00AA
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0xDD0044
  STORE r7, r5
  ADD r7, r7, r10
  LDI r5, 0x00AAFF
  STORE r7, r5
  ADD r7, r7, r10
main_0:
  CMPI r13, 0xD659A4
  CMPI r7, r10, 8
  MOD r2, r7, r11
  FRAME
  JMP main_0
