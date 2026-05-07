; counted animation
; initialization
  LDI r8, 0xBDFB84
  LDI r6, 1
  LDI r14, 3434
  LDI r15, 0xD7C60A
  LDI r14, 1
loop_0:
  LDI r6, 257
  FILL r6
  CMPI r2, r12, 0x292686
  ADDI r13, r5, 0xD6D659
  LDI r6, 1
  SUB r14, r14, r6
  JNZ r14, loop_0
  LDI r12, 2
loop_1:
  OR r4, r8, r12
  ADDI r14, r2, 155
  LDI r13, 2169
  LDI r8, 4045
  LDI r15, 3469
  LDI r1, 0xDF4114
  CIRCLE r13, r8, r15, r1
  LDI r9, 1
  SUB r12, r12, r9
  JNZ r12, loop_1
  HALT
