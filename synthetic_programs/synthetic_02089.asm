; counted animation
; initialization
  LDI r15, 1562
  LDI r14, 0x5BBE75
  LDI r4, 3995
  LDI r10, 1
  LDI r9, 8
  LDI r3, 3388
  LDI r1, 255
  LDI r11, 0x6947F3
  LDI r5, 1
loop_0:
  LDI r30, 128
  LDI r3, 2097
  LDI r12, 2650
  LDI r13, 255
  CIRCLE r30, r3, r12, r13
  LDI r14, 0x57E926
  LDI r15, 16
  LDI r9, 255
  LDI r15, 0xCAF19E
  CIRCLE r14, r15, r9, r15
  LDI r7, 1
  LDI r2, 32
  LDI r13, 3675
  LDI r0, 1
  LDI r14, 3103
  LINE r7, r2, r13, r0, r14
  LDI r8, 16
  LDI r5, 54
  LDI r26, 8
  LDI r13, 0xE1E1C3
  CIRCLE r8, r5, r26, r13
  LDI r4, 1
  SUB r5, r5, r4
  JNZ r5, loop_0
  HALT
