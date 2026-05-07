; mixed program
; initialization
  LDI r11, 509
  LDI r14, 304
  LDI r4, 458
  LDI r5, 3523
  LDI r6, 1972
  LDI r3, 1
  LDI r0, 0
  CMP r11, r24
  LDI r0, 2397
  LDI r0, 3153
  LDI r13, 0x2D7F10
  DRAWTEXT r0, r0, r13, "WORLD"
  LDI r1, 32
loop_0:
  LDI r10, 2128
  LDI r13, 1
  LDI r15, 0x4ACAFE
  PSET r10, r13, r15
  CMPI r15, r1, 0x328D8D
  ADD r12, r14, r0
  AND r1, r4, r7
  LDI r4, 1
  SUB r1, r1, r4
  JNZ r1, loop_0
  LDI r1, 1485
  LDI r15, 0x45D7CC
  LDI r15, 8
  TEXT r1, r15, r15, "HELLO"
  CMPI r14, 0x70A2BE
  OR r2, r7, r11
  AND r15, r2, r13
  OR r2, r8, r13
  XOR r5, r15, r7
  AND r4, r14, r8
  LDI r3, 0x85951C
  LDI r4, 2
  LDI r4, 2092
  TEXT r3, r4, r4, "HELLO"
  HALT
