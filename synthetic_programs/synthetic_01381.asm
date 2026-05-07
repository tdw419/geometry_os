; drawing loop program
; initialization
  LDI r12, 424
  LDI r1, 0x60FC69
  LDI r10, 16
; palette
  LDI r7, 0x205C
  LDI r3, 1
  LDI r5, 0xFF8800
  STORE r7, r5
  ADD r7, r7, r3
  LDI r5, 0x00AAFF
  STORE r7, r5
  ADD r7, r7, r3
  LDI r5, 0x444444
  STORE r7, r5
  ADD r7, r7, r3
  LDI r5, 0x0000CC
  STORE r7, r5
  ADD r7, r7, r3
  LDI r5, 0xAAFF00
  STORE r7, r5
  ADD r7, r7, r3
  LDI r5, 0xFF00FF
  STORE r7, r5
  ADD r7, r7, r3
  LDI r5, 0x000066
  STORE r7, r5
  ADD r7, r7, r3
  LDI r5, 0x00FFFF
  STORE r7, r5
  ADD r7, r7, r3
main_0:
  IKEY r12
  CMPI r12, 0x8787EF
  JNZ r12, key_1
  IKEY r3
  CMPI r3, 222
  JNZ r3, key_2
  IKEY r29
  CMPI r29, 0x79DDC2
  JNZ r29, key_3
  CMPI r2, 227
  FRAME
  JMP main_0
