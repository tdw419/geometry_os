; mixed program
; initialization
  LDI r15, 10
  LDI r14, 0
  LDI r5, 4094
  LDI r4, 2987
  LDI r9, 16
  LDI r10, 824
  LDI r7, 0xFA104E
  LDI r8, 1848
; palette
  LDI r4, 0x23E1
  LDI r2, 1
  LDI r1, 0xAAAAAA
  STORE r4, r1
  ADD r4, r4, r2
  LDI r1, 0x550077
  STORE r4, r1
  ADD r4, r4, r2
  LDI r1, 0x550077
  STORE r4, r1
  ADD r4, r4, r2
  LDI r1, 0xDD0044
  STORE r4, r1
  ADD r4, r4, r2
  LDI r1, 0x00FFAA
  STORE r4, r1
  ADD r4, r4, r2
  LDI r1, 0xFFFFFF
  STORE r4, r1
  ADD r4, r4, r2
  LDI r1, 0xDD0044
  STORE r4, r1
  ADD r4, r4, r2
  LDI r1, 0x44FF00
  STORE r4, r1
  ADD r4, r4, r2
  LDI r1, 0x000000
  STORE r4, r1
  ADD r4, r4, r2
  LDI r1, 0x0000CC
  STORE r4, r1
  ADD r4, r4, r2
  CMP r2, r9
  XOR r1, r9, r6
  OR r6, r9, r31
  XOR r7, r15, r11
  CMPI r15, 0x1551B9
  HALT
