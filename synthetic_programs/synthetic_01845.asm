; mixed program
; initialization
  LDI r11, 958
  LDI r6, 2642
  LDI r5, 3882
; palette
  LDI r3, 0x50B9
  LDI r11, 1
  LDI r8, 0xAAFF00
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0xDD0044
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0x0044FF
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0xAAFF00
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0x0044FF
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0xFFAA00
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0x00FFFF
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0x00FFFF
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0xFFAA00
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0x00FFFF
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0x00FFFF
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0x008888
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0xFFFF00
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0x0000FF
  STORE r3, r8
  ADD r3, r3, r11
  LDI r8, 0x0000CC
  STORE r3, r8
  ADD r3, r3, r11
  LDI r19, 64
  STORE r19, r9
  LOAD r2, r19
  LDI r8, 1047
  STORE r8, r13
  LOAD r5, r8
  LDI r0, 255
  STORE r0, r5
  LOAD r29, r0
  LDI r10, 0xF7258A
  STORE r10, r1
  LOAD r3, r10
  PUSH r7
  PUSH r12
  PUSH r14
  PUSH r6
  DIV r14, r2, r29
  SHL r6, r8, r2
  SHL r7, r9, r2
  DIV r6, r1, r31
  POP r6
  POP r14
  POP r12
  POP r7
  XOR r0, r12, r11
  AND r11, r15, r7
  OR r5, r11, r28
  XOR r2, r10, r8
  LDI r15, 16
  LDI r15, 0x0050DB
  LDI r15, 634
  TEXT r15, r15, r15, "HELLO"
  HALT
