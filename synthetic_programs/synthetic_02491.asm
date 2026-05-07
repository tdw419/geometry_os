; mixed program
; initialization
  LDI r12, 0x4CEDEE
  LDI r15, 10
  LDI r13, 0xD0316A
; palette
  LDI r5, 0x2303
  LDI r4, 1
  LDI r7, 0x00FF44
  STORE r5, r7
  ADD r5, r5, r4
  LDI r7, 0x880088
  STORE r5, r7
  ADD r5, r5, r4
  LDI r7, 0xFFEE00
  STORE r5, r7
  ADD r5, r5, r4
  LDI r7, 0x00FF00
  STORE r5, r7
  ADD r5, r5, r4
  LDI r7, 0xFF0000
  STORE r5, r7
  ADD r5, r5, r4
  LDI r6, 2410
  LDI r15, 0xCD39B8
  LDI r6, 0x2D28D6
  DRAWTEXT r6, r15, r6, "WORLD"
  IKEY r8
  CMPI r8, 8
  JNZ r8, key_0
  LDI r7, 1542
  LDI r8, 1523
  LDI r2, 0
  TEXT r7, r8, r2, "HELLO"
  CALL func_1
func_1:
  DIV r15, r10, r14
  MUL r15, r3, r2
  DIV r12, r11, r4
  RET
  LDI r6, 3660
  LDI r6, 0xB2E8FC
  LDI r4, 16
  TEXT r6, r6, r4, "HELLO"
  LDI r5, 3733
  STORE r5, r1
  LOAD r13, r5
  LDI r2, 2520
  STORE r2, r2
  LOAD r11, r2
  LDI r4, 32
  STORE r4, r18
  LOAD r11, r4
  LDI r7, 657
  STORE r7, r8
  LOAD r14, r7
  HALT
