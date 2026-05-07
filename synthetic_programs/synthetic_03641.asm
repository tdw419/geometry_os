; drawing loop program
; initialization
  LDI r5, 255
  LDI r4, 1
  LDI r13, 16
  LDI r3, 1827
  LDI r6, 0x529ACD
; palette
  LDI r14, 0x202B
  LDI r1, 1
  LDI r6, 0x0000FF
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0xAAAAAA
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0x000066
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0xFFFF00
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0x888800
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0x44FF00
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0x00FFFF
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0x00FF00
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0x0044FF
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0xFF4400
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0xDD0044
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0x000066
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0xFF8800
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0xFFFFFF
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0x550077
  STORE r14, r6
  ADD r14, r14, r1
  LDI r6, 0x44FF00
  STORE r14, r6
  ADD r14, r14, r1
main_0:
  CMP r7, r12
  IKEY r3
  CMPI r3, 255
  JNZ r3, key_1
  ANDI r8, r11, 0x36F76F
  FRAME
  JMP main_0
