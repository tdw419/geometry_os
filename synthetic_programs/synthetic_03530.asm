; drawing loop program
; initialization
  LDI r2, 2773
  LDI r3, 0xD2C2C6
  LDI r7, 1989
  LDI r10, 128
  LDI r8, 0x44C2AD
  LDI r5, 2544
; palette
  LDI r2, 0x40F2
  LDI r3, 1
  LDI r10, 0xFF8800
  STORE r2, r10
  ADD r2, r2, r3
  LDI r10, 0x00FFFF
  STORE r2, r10
  ADD r2, r2, r3
  LDI r10, 0x550077
  STORE r2, r10
  ADD r2, r2, r3
  LDI r10, 0x000066
  STORE r2, r10
  ADD r2, r2, r3
  LDI r10, 0x008888
  STORE r2, r10
  ADD r2, r2, r3
  LDI r10, 0xAAAAAA
  STORE r2, r10
  ADD r2, r2, r3
  LDI r10, 0xFFFF00
  STORE r2, r10
  ADD r2, r2, r3
  LDI r10, 0xAAFF00
  STORE r2, r10
  ADD r2, r2, r3
  LDI r10, 0x0044FF
  STORE r2, r10
  ADD r2, r2, r3
  LDI r10, 0x8800FF
  STORE r2, r10
  ADD r2, r2, r3
  LDI r10, 0x00FFFF
  STORE r2, r10
  ADD r2, r2, r3
main_0:
  ADDI r2, r14, 0x328AF9
  CMP r1, r15
  IKEY r3
  CMPI r3, 149
  JNZ r3, key_1
  FRAME
  JMP main_0
