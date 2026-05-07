; drawing loop program
; initialization
  LDI r15, 746
  LDI r5, 4
  LDI r6, 10
; palette
  LDI r1, 0x50E7
  LDI r10, 1
  LDI r13, 0x44FF00
  STORE r1, r13
  ADD r1, r1, r10
  LDI r13, 0xFF00FF
  STORE r1, r13
  ADD r1, r1, r10
  LDI r13, 0x00FF00
  STORE r1, r13
  ADD r1, r1, r10
  LDI r13, 0xFFAA00
  STORE r1, r13
  ADD r1, r1, r10
  LDI r13, 0xAA00AA
  STORE r1, r13
  ADD r1, r1, r10
  LDI r13, 0xFFFFFF
  STORE r1, r13
  ADD r1, r1, r10
  LDI r13, 0x888800
  STORE r1, r13
  ADD r1, r1, r10
  LDI r13, 0x00FFAA
  STORE r1, r13
  ADD r1, r1, r10
  LDI r13, 0xAAAAAA
  STORE r1, r13
  ADD r1, r1, r10
main_0:
  LDI r5, 823
  LDI r1, 0xC9F6AC
  LDI r8, 3217
  TEXT r5, r1, r8, "HELLO"
  CMP r6, r10
  XOR r7, r10, r3
  OR r4, r2, r15
  XOR r2, r3, r4
  FRAME
  JMP main_0
