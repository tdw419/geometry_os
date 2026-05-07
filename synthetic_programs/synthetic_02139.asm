; counted animation
; initialization
  LDI r4, 255
  LDI r1, 64
  LDI r0, 1011
  LDI r9, 128
  LDI r2, 3458
  LDI r15, 3200
  LDI r14, 2244
  LDI r10, 1888
  LDI r2, 0x121615
loop_0:
  LDI r1, 256
  LDI r2, 32
  LDI r10, 255
  PSET r1, r2, r10
  SUBI r13, r23, 255
  LDI r14, 1
  SUB r2, r2, r14
  JNZ r2, loop_0
  LDI r9, 2
loop_1:
  OR r14, r0, r7
  LDI r17, 1
  SUB r9, r9, r17
  JNZ r9, loop_1
  LDI r15, 0x477861
loop_2:
  AND r2, r3, r13
  LDI r19, 10
  LDI r5, 578
  LDI r13, 2374
  WPIXEL
  DIV r1, r14, r15
  LDI r12, 1
  SUB r15, r15, r12
  JNZ r15, loop_2
  HALT
