; drawing loop program
; initialization
  LDI r0, 1234
  LDI r2, 0x94B162
  LDI r9, 0xB11B0F
; palette
  LDI r0, 0x2106
  LDI r12, 1
  LDI r1, 0x44FF00
  STORE r0, r1
  ADD r0, r0, r12
  LDI r1, 0x00FF44
  STORE r0, r1
  ADD r0, r0, r12
  LDI r1, 0x00FFAA
  STORE r0, r1
  ADD r0, r0, r12
  LDI r1, 0x550077
  STORE r0, r1
  ADD r0, r0, r12
  LDI r1, 0xFFEE00
  STORE r0, r1
  ADD r0, r0, r12
  LDI r1, 0xAAAAAA
  STORE r0, r1
  ADD r0, r0, r12
  LDI r1, 0x00AAFF
  STORE r0, r1
  ADD r0, r0, r12
  LDI r1, 0xAAAAAA
  STORE r0, r1
  ADD r0, r0, r12
  LDI r1, 0x00FF44
  STORE r0, r1
  ADD r0, r0, r12
main_0:
  XOR r5, r1, r27
  XOR r3, r22, r12
  XOR r12, r1, r0
  ANDI r14, r9, 82
  FRAME
  JMP main_0
