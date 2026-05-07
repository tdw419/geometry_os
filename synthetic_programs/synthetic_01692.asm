; drawing loop program
; initialization
  LDI r15, 255
  LDI r3, 2547
  LDI r9, 1656
; palette
  LDI r12, 0x2145
  LDI r3, 1
  LDI r1, 0xAAAAAA
  STORE r12, r1
  ADD r12, r12, r3
  LDI r1, 0x8800FF
  STORE r12, r1
  ADD r12, r12, r3
  LDI r1, 0x00FFFF
  STORE r12, r1
  ADD r12, r12, r3
  LDI r1, 0x550077
  STORE r12, r1
  ADD r12, r12, r3
  LDI r1, 0x444444
  STORE r12, r1
  ADD r12, r12, r3
  LDI r1, 0xFF00FF
  STORE r12, r1
  ADD r12, r12, r3
  LDI r1, 0x00FF44
  STORE r12, r1
  ADD r12, r12, r3
  LDI r1, 0xFF8800
  STORE r12, r1
  ADD r12, r12, r3
  LDI r1, 0x00FFAA
  STORE r12, r1
  ADD r12, r12, r3
  LDI r1, 0xFF00FF
  STORE r12, r1
  ADD r12, r12, r3
  LDI r1, 0xDD0044
  STORE r12, r1
  ADD r12, r12, r3
  LDI r1, 0x00FFAA
  STORE r12, r1
  ADD r12, r12, r3
  LDI r1, 0x00FF00
  STORE r12, r1
  ADD r12, r12, r3
  LDI r1, 0x00FFAA
  STORE r12, r1
  ADD r12, r12, r3
main_0:
  ANDI r27, r2, 8
  CMPI r7, 0x89AFEB
  FRAME
  JMP main_0
