; drawing loop program
; initialization
  LDI r13, 128
  LDI r8, 4
; palette
  LDI r14, 0x6043
  LDI r7, 1
  LDI r2, 0xFFFFFF
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0xFFFF00
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0xAAFF00
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0xAAFF00
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0x008888
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0x444444
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0xFFEE00
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0x44FF00
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0x0044FF
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0xFF8800
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0xFF00FF
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0x000000
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0x888800
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0x0000FF
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0xAAAAAA
  STORE r14, r2
  ADD r14, r14, r7
  LDI r2, 0x444444
  STORE r14, r2
  ADD r14, r14, r7
main_0:
  XOR r12, r14, r13
  AND r2, r10, r25
  AND r3, r14, r0
  IKEY r3
  CMPI r3, 188
  JNZ r3, key_1
  OR r15, r8, r9
  AND r14, r6, r27
  OR r11, r2, r12
  OR r6, r7, r0
  FRAME
  JMP main_0
