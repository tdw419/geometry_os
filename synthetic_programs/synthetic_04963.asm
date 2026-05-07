; drawing loop program
; initialization
  LDI r15, 2
  LDI r0, 190
; palette
  LDI r10, 0x80C9
  LDI r12, 1
  LDI r1, 0x8800FF
  STORE r10, r1
  ADD r10, r10, r12
  LDI r1, 0xFFFFFF
  STORE r10, r1
  ADD r10, r10, r12
  LDI r1, 0xFF4400
  STORE r10, r1
  ADD r10, r10, r12
  LDI r1, 0x008888
  STORE r10, r1
  ADD r10, r10, r12
  LDI r1, 0x880088
  STORE r10, r1
  ADD r10, r10, r12
  LDI r1, 0xFF4400
  STORE r10, r1
  ADD r10, r10, r12
main_0:
  CMP r7, r1
  LDI r8, 1064
  LDI r26, 3681
  LDI r6, 4049
  DRAWTEXT r8, r26, r6, "WORLD"
  IKEY r15
  CMPI r15, 23
  JNZ r15, key_1
  LDI r3, 0xE8322E
  LDI r14, 1398
  LDI r1, 2879
  PSETI
  LDI r1, 0xECE83A
  LDI r12, 203
  LDI r12, 0x913ECC
  TEXT r1, r12, r12, "HELLO"
  FRAME
  JMP main_0
