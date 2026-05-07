; drawing loop program
; initialization
  LDI r0, 255
  LDI r8, 0x9BA4D9
  LDI r9, 0x9DA327
  LDI r28, 0xAE2CF0
  LDI r2, 32
  LDI r15, 0x618EEF
  LDI r4, 672
  LDI r3, 255
; palette
  LDI r2, 0x5090
  LDI r11, 1
  LDI r25, 0xFF0000
  STORE r2, r25
  ADD r2, r2, r11
  LDI r25, 0x880088
  STORE r2, r25
  ADD r2, r2, r11
  LDI r25, 0xFF4400
  STORE r2, r25
  ADD r2, r2, r11
  LDI r25, 0x888800
  STORE r2, r25
  ADD r2, r2, r11
main_0:
  IKEY r9
  CMPI r9, 32
  JNZ r9, key_1
  LDI r13, 0xF1ACC3
  LDI r3, 827
  LDI r1, 255
  WPIXEL
  FRAME
  JMP main_0
