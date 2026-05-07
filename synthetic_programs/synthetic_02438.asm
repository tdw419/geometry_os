; counted animation
; initialization
  LDI r14, 761
  LDI r13, 0xB52C97
  LDI r3, 10
  LDI r2, 1
  LDI r1, 511
  LDI r6, 1816
  LDI r25, 32
  LDI r7, 56
  LDI r13, 2
loop_0:
  OR r13, r4, r6
  LDI r2, 3576
  LDI r1, 0x786FD0
  LDI r8, 0xAA738B
  LDI r5, 4
  CIRCLE r2, r1, r8, r5
  LDI r2, 1
  SUB r13, r13, r2
  JNZ r13, loop_0
  LDI r10, 256
loop_1:
  AND r11, r1, r12
  LDI r4, 1
  SUB r10, r10, r4
  JNZ r10, loop_1
  HALT
