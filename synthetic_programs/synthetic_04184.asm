; drawing loop program
; initialization
  LDI r8, 2790
  LDI r5, 2
  LDI r6, 0xE8C3A4
  LDI r3, 2803
; palette
  LDI r11, 0x227F
  LDI r14, 1
  LDI r19, 0x00AAFF
  STORE r11, r19
  ADD r11, r11, r14
  LDI r19, 0xAAAAAA
  STORE r11, r19
  ADD r11, r11, r14
  LDI r19, 0x0044FF
  STORE r11, r19
  ADD r11, r11, r14
  LDI r19, 0x0000CC
  STORE r11, r19
  ADD r11, r11, r14
main_0:
  ANDI r6, r9, 67
  LDI r8, 0x7A2D67
  LDI r3, 0xA5026A
  LDI r0, 0xDE7CA5
  PSET r8, r3, r0
  SAR r15, r19, r16
  SHLI r7, r9, 6
  SAR r4, r14, r10
  CMP r23, r8
  IKEY r3
  CMPI r3, 0
  JNZ r3, key_1
  LDI r6, 2018
  FILL r6
  FRAME
  JMP main_0
