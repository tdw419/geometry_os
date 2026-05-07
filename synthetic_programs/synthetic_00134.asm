; counted animation
; initialization
  LDI r3, 128
  LDI r5, 1224
  LDI r7, 571
  LDI r1, 3455
  LDI r0, 3391
  LDI r0, 0x3BB952
loop_0:
  AND r4, r0, r10
  LDI r30, 1
  SUB r0, r0, r30
  JNZ r0, loop_0
  LDI r14, 11
loop_1:
  LDI r13, 4
  LDI r23, 1467
  LDI r4, 2
  PSETI
  LDI r16, 1
  SUB r14, r14, r16
  JNZ r14, loop_1
  LDI r4, 0xE3CC3F
loop_2:
  LDI r7, 1482
  LDI r5, 0x578267
  LDI r3, 35
  PSET r7, r5, r3
  LDI r3, 1
  SUB r4, r4, r3
  JNZ r4, loop_2
  HALT
