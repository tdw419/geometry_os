; drawing loop program
; initialization
  LDI r4, 256
  LDI r10, 0xCF8064
  LDI r2, 0xDB57F6
  LDI r9, 719
; palette
  LDI r11, 0x8050
  LDI r7, 1
  LDI r5, 0x000000
  STORE r11, r5
  ADD r11, r11, r7
  LDI r5, 0x550077
  STORE r11, r5
  ADD r11, r11, r7
  LDI r5, 0x000000
  STORE r11, r5
  ADD r11, r11, r7
  LDI r5, 0x00FF00
  STORE r11, r5
  ADD r11, r11, r7
  LDI r5, 0x0000FF
  STORE r11, r5
  ADD r11, r11, r7
  LDI r5, 0xFF4400
  STORE r11, r5
  ADD r11, r11, r7
  LDI r5, 0x0044FF
  STORE r11, r5
  ADD r11, r11, r7
  LDI r5, 0x00AAFF
  STORE r11, r5
  ADD r11, r11, r7
main_0:
  DIV r8, r13, r11
  LDI r12, 64
  LDI r14, 10
  LDI r14, 3300
  WPIXEL
  IKEY r7
  CMPI r7, 249
  JNZ r7, key_1
  CMP r4, r3
  SHLI r1, r7, 7
  SAR r4, r0, r15
  SAR r12, r9, r0
  SAR r8, r15, r14
  ANDI r5, r3, 112
  FRAME
  JMP main_0
