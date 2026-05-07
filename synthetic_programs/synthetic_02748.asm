; drawing loop program
; initialization
  LDI r4, 10
  LDI r3, 2594
  LDI r2, 2184
  LDI r1, 0x68557F
; palette
  LDI r7, 0x70A4
  LDI r6, 1
  LDI r10, 0xAAFF00
  STORE r7, r10
  ADD r7, r7, r6
  LDI r10, 0x00AAFF
  STORE r7, r10
  ADD r7, r7, r6
  LDI r10, 0x00FFAA
  STORE r7, r10
  ADD r7, r7, r6
  LDI r10, 0x00FFFF
  STORE r7, r10
  ADD r7, r7, r6
  LDI r10, 0xFF8800
  STORE r7, r10
  ADD r7, r7, r6
  LDI r10, 0x00AAFF
  STORE r7, r10
  ADD r7, r7, r6
  LDI r10, 0x0000FF
  STORE r7, r10
  ADD r7, r7, r6
  LDI r10, 0x44FF00
  STORE r7, r10
  ADD r7, r7, r6
  LDI r10, 0xAAAAAA
  STORE r7, r10
  ADD r7, r7, r6
  LDI r10, 0xAAFF00
  STORE r7, r10
  ADD r7, r7, r6
  LDI r10, 0xFF4400
  STORE r7, r10
  ADD r7, r7, r6
  LDI r10, 0xFF8800
  STORE r7, r10
  ADD r7, r7, r6
main_0:
  XOR r8, r2, r1
  IKEY r12
  CMPI r12, 2
  JNZ r12, key_1
  IKEY r13
  CMPI r13, 64
  JNZ r13, key_2
  CMPI r1, 0xB9E63E
  LDI r6, 4
  LDI r13, 16
  LDI r3, 175
  TEXT r6, r13, r3, "HELLO"
  CMPI r6, r4, 0x8EABAA
  FRAME
  JMP main_0
