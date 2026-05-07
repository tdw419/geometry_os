; drawing loop program
; initialization
  LDI r7, 0x6FFBDF
  LDI r15, 0x253CEE
  LDI r3, 0x1DFE82
  LDI r14, 0xF71BA2
; palette
  LDI r17, 0x8004
  LDI r1, 1
  LDI r7, 0x0044FF
  STORE r17, r7
  ADD r17, r17, r1
  LDI r7, 0xFF4400
  STORE r17, r7
  ADD r17, r17, r1
  LDI r7, 0xFF00FF
  STORE r17, r7
  ADD r17, r17, r1
  LDI r7, 0x8800FF
  STORE r17, r7
  ADD r17, r17, r1
  LDI r7, 0xAAFF00
  STORE r17, r7
  ADD r17, r17, r1
  LDI r7, 0xFFAA00
  STORE r17, r7
  ADD r17, r17, r1
  LDI r7, 0x00FF44
  STORE r17, r7
  ADD r17, r17, r1
  LDI r7, 0xAAFF00
  STORE r17, r7
  ADD r17, r17, r1
  LDI r7, 0x00FF00
  STORE r17, r7
  ADD r17, r17, r1
  LDI r7, 0xFFFF00
  STORE r17, r7
  ADD r17, r17, r1
  LDI r7, 0x550077
  STORE r17, r7
  ADD r17, r17, r1
  LDI r7, 0xFF00FF
  STORE r17, r7
  ADD r17, r17, r1
main_0:
  SHR r0, r6, r2
  IKEY r11
  CMPI r11, 0xE6D832
  JNZ r11, key_1
  SUBI r1, r2, 0x328C7F
  FRAME
  JMP main_0
