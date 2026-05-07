; drawing loop program
; initialization
  LDI r6, 0x39D261
  LDI r11, 41
  LDI r14, 255
  LDI r4, 0
  LDI r13, 64
  LDI r2, 2
; palette
  LDI r3, 0x2489
  LDI r11, 1
  LDI r10, 0xAAFF00
  STORE r3, r10
  ADD r3, r3, r11
  LDI r10, 0x44FF00
  STORE r3, r10
  ADD r3, r3, r11
  LDI r10, 0x0000CC
  STORE r3, r10
  ADD r3, r3, r11
  LDI r10, 0xFFEE00
  STORE r3, r10
  ADD r3, r3, r11
  LDI r10, 0xFF00FF
  STORE r3, r10
  ADD r3, r3, r11
  LDI r10, 0x880088
  STORE r3, r10
  ADD r3, r3, r11
main_0:
  SHL r0, r5, r15
  SHL r2, r1, r25
  IKEY r13
  CMPI r13, 0x87304B
  JNZ r13, key_1
  XOR r9, r14, r3
  AND r5, r15, r14
  OR r23, r8, r0
  OR r10, r5, r12
  FRAME
  JMP main_0
