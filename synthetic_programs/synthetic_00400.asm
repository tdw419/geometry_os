; drawing loop program
; initialization
  LDI r5, 8
  LDI r1, 2
; palette
  LDI r19, 0x4023
  LDI r8, 1
  LDI r6, 0xAAFF00
  STORE r19, r6
  ADD r19, r19, r8
  LDI r6, 0xFFEE00
  STORE r19, r6
  ADD r19, r19, r8
  LDI r6, 0xDD0044
  STORE r19, r6
  ADD r19, r19, r8
  LDI r6, 0x888800
  STORE r19, r6
  ADD r19, r19, r8
  LDI r6, 0x8800FF
  STORE r19, r6
  ADD r19, r19, r8
  LDI r6, 0xFF8800
  STORE r19, r6
  ADD r19, r19, r8
  LDI r6, 0x000000
  STORE r19, r6
  ADD r19, r19, r8
  LDI r6, 0xFFEE00
  STORE r19, r6
  ADD r19, r19, r8
main_0:
  XOR r10, r8, r2
  SHR r7, r12, r4
  SHR r7, r18, r15
  SAR r12, r7, r1
  SAR r12, r31, r8
  IKEY r3
  CMPI r3, 41
  JNZ r3, key_1
  FRAME
  JMP main_0
