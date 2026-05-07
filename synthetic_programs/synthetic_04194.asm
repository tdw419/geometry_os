; drawing loop program
; initialization
  LDI r14, 0x3545FE
  LDI r11, 0x4788AF
  LDI r5, 347
; palette
  LDI r12, 0x216D
  LDI r14, 1
  LDI r11, 0xFF8800
  STORE r12, r11
  ADD r12, r12, r14
  LDI r11, 0x00FF44
  STORE r12, r11
  ADD r12, r12, r14
  LDI r11, 0x00AAFF
  STORE r12, r11
  ADD r12, r12, r14
  LDI r11, 0x00FFFF
  STORE r12, r11
  ADD r12, r12, r14
  LDI r11, 0x880088
  STORE r12, r11
  ADD r12, r12, r14
  LDI r11, 0xFF8800
  STORE r12, r11
  ADD r12, r12, r14
  LDI r11, 0x880088
  STORE r12, r11
  ADD r12, r12, r14
  LDI r11, 0x888800
  STORE r12, r11
  ADD r12, r12, r14
  LDI r11, 0x00FF44
  STORE r12, r11
  ADD r12, r12, r14
  LDI r11, 0xFFEE00
  STORE r12, r11
  ADD r12, r12, r14
  LDI r11, 0x0044FF
  STORE r12, r11
  ADD r12, r12, r14
main_0:
  LDI r16, 32
  LDI r7, 0x4CFE8F
  LDI r1, 0
  LDI r5, 0
  LDI r11, 803
  RECTF r16, r7, r1, r5, r11
  LDI r15, 0x195309
  LDI r6, 3546
  LDI r7, 255
  LDI r4, 3808
  LDI r9, 0xA0287F
  LINE r15, r6, r7, r4, r9
  IKEY r13
  CMPI r13, 1
  JNZ r13, key_1
  CMP r6, r7
  OR r1, r28, r4
  XOR r10, r8, r0
  FRAME
  JMP main_0
