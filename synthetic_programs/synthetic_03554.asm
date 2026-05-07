; drawing loop program
; initialization
  LDI r7, 0xAE1BAC
  LDI r15, 2560
  LDI r11, 64
  LDI r5, 256
  LDI r6, 156
  LDI r9, 10
; palette
  LDI r14, 0x50A4
  LDI r0, 1
  LDI r15, 0x00AAFF
  STORE r14, r15
  ADD r14, r14, r0
  LDI r15, 0x00AAFF
  STORE r14, r15
  ADD r14, r14, r0
  LDI r15, 0x00FF44
  STORE r14, r15
  ADD r14, r14, r0
  LDI r15, 0x000000
  STORE r14, r15
  ADD r14, r14, r0
main_0:
  IKEY r14
  CMPI r14, 51
  JNZ r14, key_1
  CMP r3, r14
  CMP r10, r31
  LDI r9, 2391
  LDI r3, 2088
  LDI r12, 496
  LDI r11, 16
  LDI r3, 0x0295B7
  RECTF r9, r3, r12, r11, r3
  FRAME
  JMP main_0
