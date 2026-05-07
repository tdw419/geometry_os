; drawing loop program
; initialization
  LDI r9, 1
  LDI r3, 2932
  LDI r11, 868
; palette
  LDI r14, 0x246B
  LDI r8, 1
  LDI r3, 0x44FF00
  STORE r14, r3
  ADD r14, r14, r8
  LDI r3, 0xFF00FF
  STORE r14, r3
  ADD r14, r14, r8
  LDI r3, 0x888800
  STORE r14, r3
  ADD r14, r14, r8
  LDI r3, 0x880088
  STORE r14, r3
  ADD r14, r14, r8
  LDI r3, 0xFF8800
  STORE r14, r3
  ADD r14, r14, r8
  LDI r3, 0x0044FF
  STORE r14, r3
  ADD r14, r14, r8
main_0:
  IKEY r5
  CMPI r5, 238
  JNZ r5, key_1
  ADDI r2, r11, 0xF3217E
  ANDI r6, r24, 256
  IKEY r8
  CMPI r8, 16
  JNZ r8, key_2
  ANDI r10, r11, 0x056C6B
  LDI r15, 2
  LDI r1, 2928
  LDI r3, 0xE793BD
  LDI r28, 2
  LDI r4, 0
  RECTF r15, r1, r3, r28, r4
  FRAME
  JMP main_0
