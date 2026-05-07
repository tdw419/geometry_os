; drawing loop program
; initialization
  LDI r0, 0xA59389
  LDI r14, 2318
  LDI r3, 0xEB2B48
  LDI r6, 16
  LDI r8, 916
  LDI r4, 255
; palette
  LDI r11, 0x2378
  LDI r0, 1
  LDI r1, 0x00FF00
  STORE r11, r1
  ADD r11, r11, r0
  LDI r1, 0xFF4400
  STORE r11, r1
  ADD r11, r11, r0
  LDI r1, 0xAAAAAA
  STORE r11, r1
  ADD r11, r11, r0
  LDI r1, 0xFF8800
  STORE r11, r1
  ADD r11, r11, r0
  LDI r1, 0x000000
  STORE r11, r1
  ADD r11, r11, r0
  LDI r1, 0x0000FF
  STORE r11, r1
  ADD r11, r11, r0
  LDI r1, 0x00FF00
  STORE r11, r1
  ADD r11, r11, r0
  LDI r1, 0xFF0000
  STORE r11, r1
  ADD r11, r11, r0
main_0:
  XOR r3, r10, r5
  AND r13, r10, r11
  XOR r7, r11, r31
  IKEY r6
  CMPI r6, 256
  JNZ r6, key_1
  IKEY r13
  CMPI r13, 16
  JNZ r13, key_2
  FRAME
  JMP main_0
