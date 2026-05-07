; drawing loop program
; initialization
  LDI r5, 0xA5C6B5
  LDI r6, 32
  LDI r9, 256
  LDI r31, 4
  LDI r15, 0xC31E73
  LDI r8, 32
  LDI r14, 0x6C8F2B
; palette
  LDI r3, 0x70DE
  LDI r8, 1
  LDI r10, 0xAAFF00
  STORE r3, r10
  ADD r3, r3, r8
  LDI r10, 0x00AAFF
  STORE r3, r10
  ADD r3, r3, r8
  LDI r10, 0x0000FF
  STORE r3, r10
  ADD r3, r3, r8
  LDI r10, 0xAAAAAA
  STORE r3, r10
  ADD r3, r3, r8
  LDI r10, 0xFFAA00
  STORE r3, r10
  ADD r3, r3, r8
  LDI r10, 0xAAAAAA
  STORE r3, r10
  ADD r3, r3, r8
  LDI r10, 0xFF00FF
  STORE r3, r10
  ADD r3, r3, r8
  LDI r10, 0xAA00AA
  STORE r3, r10
  ADD r3, r3, r8
  LDI r10, 0x00FF44
  STORE r3, r10
  ADD r3, r3, r8
  LDI r10, 0x00FFFF
  STORE r3, r10
  ADD r3, r3, r8
  LDI r10, 0x0000FF
  STORE r3, r10
  ADD r3, r3, r8
  LDI r10, 0x0000FF
  STORE r3, r10
  ADD r3, r3, r8
main_0:
  SHLI r13, r10, 2
  SHL r6, r7, r14
  SHL r12, r5, r15
  SHLI r2, r8, 0
  SHLI r12, r15, 0
  CMP r9, r3
  IKEY r14
  CMPI r14, 50
  JNZ r14, key_1
  SHL r29, r8, r10
  SHLI r13, r10, 0xE6B5A8
  SHL r0, r3, r8
  FRAME
  JMP main_0
