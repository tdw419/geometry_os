; mixed program
; initialization
  LDI r5, 0x539300
  LDI r10, 1868
  LDI r3, 8
  LDI r30, 32
  LDI r2, 1279
  LDI r1, 4
  LDI r7, 0
; palette
  LDI r7, 0x306A
  LDI r14, 1
  LDI r13, 0x0044FF
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0x444444
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0x0000CC
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0x550077
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0x888800
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0xFFFF00
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0xFFAA00
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0xFFFFFF
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0xFFAA00
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0x008888
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0x0000CC
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0xFF4400
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0x00FFFF
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0x00FF44
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0xFFFFFF
  STORE r7, r13
  ADD r7, r7, r14
  LDI r13, 0x888800
  STORE r7, r13
  ADD r7, r7, r14
  LDI r0, 0x0E81C9
loop_0:
  SUBI r14, r11, 1
  CMPI r4, r1, 2
  LDI r7, 1
  SUB r0, r0, r7
  JNZ r0, loop_0
  LDI r1, 0xAF3801
  LDI r12, 973
  LDI r8, 1640
  PSET r1, r12, r8
  CMPI r9, 248
  HALT
