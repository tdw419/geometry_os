; drawing loop program
; initialization
  LDI r0, 8
  LDI r13, 2664
; palette
  LDI r8, 0x2064
  LDI r15, 1
  LDI r13, 0x000066
  STORE r8, r13
  ADD r8, r8, r15
  LDI r13, 0xFFEE00
  STORE r8, r13
  ADD r8, r8, r15
  LDI r13, 0xDD0044
  STORE r8, r13
  ADD r8, r8, r15
  LDI r13, 0xFF0000
  STORE r8, r13
  ADD r8, r8, r15
  LDI r13, 0xAAFF00
  STORE r8, r13
  ADD r8, r8, r15
  LDI r13, 0xDD0044
  STORE r8, r13
  ADD r8, r8, r15
  LDI r13, 0xAAAAAA
  STORE r8, r13
  ADD r8, r8, r15
  LDI r13, 0x00FF00
  STORE r8, r13
  ADD r8, r8, r15
  LDI r13, 0xFF0000
  STORE r8, r13
  ADD r8, r8, r15
  LDI r13, 0xAAFF00
  STORE r8, r13
  ADD r8, r8, r15
  LDI r13, 0x550077
  STORE r8, r13
  ADD r8, r8, r15
  LDI r13, 0xFF0000
  STORE r8, r13
  ADD r8, r8, r15
main_0:
  SUBI r10, r6, 0x2E9E17
  IKEY r5
  CMPI r5, 0xD4EEAB
  JNZ r5, key_1
  FRAME
  JMP main_0
