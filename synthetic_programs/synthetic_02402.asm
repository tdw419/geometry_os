; drawing loop program
; initialization
  LDI r5, 0x2F81C1
  LDI r14, 0xD282BF
  LDI r3, 0x0ED9D2
; palette
  LDI r3, 0x4097
  LDI r15, 1
  LDI r0, 0xFFFF00
  STORE r3, r0
  ADD r3, r3, r15
  LDI r0, 0x00AAFF
  STORE r3, r0
  ADD r3, r3, r15
  LDI r0, 0x00FFFF
  STORE r3, r0
  ADD r3, r3, r15
  LDI r0, 0x0044FF
  STORE r3, r0
  ADD r3, r3, r15
  LDI r0, 0x0000FF
  STORE r3, r0
  ADD r3, r3, r15
  LDI r0, 0x8800FF
  STORE r3, r0
  ADD r3, r3, r15
  LDI r0, 0xFF8800
  STORE r3, r0
  ADD r3, r3, r15
  LDI r0, 0xFF0000
  STORE r3, r0
  ADD r3, r3, r15
  LDI r0, 0x00FFFF
  STORE r3, r0
  ADD r3, r3, r15
  LDI r0, 0xFFEE00
  STORE r3, r0
  ADD r3, r3, r15
  LDI r0, 0x0000CC
  STORE r3, r0
  ADD r3, r3, r15
  LDI r0, 0xFFAA00
  STORE r3, r0
  ADD r3, r3, r15
  LDI r0, 0x0044FF
  STORE r3, r0
  ADD r3, r3, r15
main_0:
  IKEY r30
  CMPI r30, 30
  JNZ r30, key_1
  SAR r9, r7, r10
  SHR r12, r4, r7
  SHLI r12, r10, 0x65299A
  ADD r1, r8, r9
  SUB r6, r14, r5
  FRAME
  JMP main_0
