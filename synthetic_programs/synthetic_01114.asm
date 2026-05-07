; drawing loop program
; initialization
  LDI r7, 10
  LDI r1, 0x1960A7
  LDI r3, 3698
  LDI r5, 128
  LDI r0, 0x555F3F
  LDI r11, 2855
  LDI r31, 0x6760BE
  LDI r4, 0x2D8BE9
; palette
  LDI r0, 0x40F9
  LDI r4, 1
  LDI r9, 0x444444
  STORE r0, r9
  ADD r0, r0, r4
  LDI r9, 0xAAFF00
  STORE r0, r9
  ADD r0, r0, r4
  LDI r9, 0x44FF00
  STORE r0, r9
  ADD r0, r0, r4
  LDI r9, 0x0044FF
  STORE r0, r9
  ADD r0, r0, r4
  LDI r9, 0x444444
  STORE r0, r9
  ADD r0, r0, r4
  LDI r9, 0x0000CC
  STORE r0, r9
  ADD r0, r0, r4
  LDI r9, 0xFFAA00
  STORE r0, r9
  ADD r0, r0, r4
  LDI r9, 0x00FF44
  STORE r0, r9
  ADD r0, r0, r4
  LDI r9, 0x000066
  STORE r0, r9
  ADD r0, r0, r4
  LDI r9, 0x888800
  STORE r0, r9
  ADD r0, r0, r4
  LDI r9, 0x0044FF
  STORE r0, r9
  ADD r0, r0, r4
main_0:
  AND r10, r5, r13
  XOR r8, r10, r12
  OR r0, r6, r2
  XOR r28, r12, r2
  CMPI r3, 169
  LDI r7, 0x15D59E
  LDI r14, 3872
  LDI r7, 0xC2A9BF
  LDI r14, 0x3B4065
  LDI r3, 256
  LINE r7, r14, r7, r14, r3
  XOR r0, r7, r8
  OR r2, r3, r7
  OR r10, r2, r12
  AND r15, r0, r11
  IKEY r15
  CMPI r15, 0x4D8F4F
  JNZ r15, key_1
  FRAME
  JMP main_0
