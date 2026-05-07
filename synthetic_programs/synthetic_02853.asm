; counted animation
; initialization
  LDI r3, 128
  LDI r5, 256
  LDI r6, 0x25498F
  LDI r12, 23
  LDI r19, 2136
  LDI r26, 0x3E1870
  LDI r10, 96
  LDI r1, 16
  LDI r19, 0x95623E
loop_0:
  ADDI r6, r30, 121
  OR r14, r10, r7
  LDI r6, 11
  LDI r9, 128
  LDI r14, 2319
  PSET r6, r9, r14
  DIV r14, r10, r5
  LDI r1, 1
  SUB r19, r19, r1
  JNZ r19, loop_0
  HALT
