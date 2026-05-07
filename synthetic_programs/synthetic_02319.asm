; drawing loop program
; initialization
  LDI r15, 547
  LDI r3, 0xE32254
  LDI r11, 1
  LDI r4, 0xBA1D52
  LDI r1, 0x8B8F56
  LDI r14, 0xDD31D3
  LDI r10, 0x0AB890
; palette
  LDI r6, 0x603C
  LDI r2, 1
  LDI r7, 0x444444
  STORE r6, r7
  ADD r6, r6, r2
  LDI r7, 0x00FF44
  STORE r6, r7
  ADD r6, r6, r2
  LDI r7, 0x44FF00
  STORE r6, r7
  ADD r6, r6, r2
  LDI r7, 0xFF8800
  STORE r6, r7
  ADD r6, r6, r2
main_0:
  LDI r7, 2579
  LDI r15, 64
  LDI r4, 0x6EA906
  TEXT r7, r15, r4, "HELLO"
  LDI r8, 16
  LDI r12, 970
  LDI r3, 277
  TEXT r8, r12, r3, "HELLO"
  FRAME
  JMP main_0
