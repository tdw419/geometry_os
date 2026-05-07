; drawing loop program
; initialization
  LDI r6, 10
  LDI r14, 32
  LDI r13, 225
  LDI r19, 1160
  LDI r4, 0x87CBFD
  LDI r10, 3254
  LDI r0, 786
; palette
  LDI r3, 0x224E
  LDI r13, 1
  LDI r5, 0x00FFAA
  STORE r3, r5
  ADD r3, r3, r13
  LDI r5, 0x880088
  STORE r3, r5
  ADD r3, r3, r13
  LDI r5, 0x000066
  STORE r3, r5
  ADD r3, r3, r13
  LDI r5, 0xFF0000
  STORE r3, r5
  ADD r3, r3, r13
main_0:
  CMP r11, r12
  IKEY r8
  CMPI r8, 8
  JNZ r8, key_1
  FRAME
  JMP main_0
