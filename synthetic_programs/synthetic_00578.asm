; drawing loop program
; initialization
  LDI r7, 2479
  LDI r1, 2
; palette
  LDI r6, 0x6053
  LDI r1, 1
  LDI r7, 0x000066
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0x44FF00
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0xFF4400
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0x0000CC
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0x888800
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0x0000CC
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0x888800
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0x00FFFF
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0x880088
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0xAAFF00
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0x00FFFF
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0xFF0000
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0x888800
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0xFF4400
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0xAA00AA
  STORE r6, r7
  ADD r6, r6, r1
  LDI r7, 0xAA00AA
  STORE r6, r7
  ADD r6, r6, r1
main_0:
  IKEY r1
  CMPI r1, 173
  JNZ r1, key_1
  LDI r13, 0x688764
  LDI r12, 4
  LDI r0, 0
  TEXT r13, r12, r0, "HELLO"
  AND r1, r3, r7
  AND r5, r13, r3
  XOR r13, r8, r6
  IKEY r3
  CMPI r3, 0x32B03A
  JNZ r3, key_2
  FRAME
  JMP main_0
