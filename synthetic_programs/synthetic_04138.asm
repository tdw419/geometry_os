; counted animation
; initialization
  LDI r8, 16
  LDI r2, 491
  LDI r10, 256
  LDI r13, 0x9F13A6
  LDI r4, 128
  LDI r12, 4
  LDI r7, 2900
  LDI r1, 2
  LDI r12, 27
loop_0:
  SHL r2, r8, r15
  LDI r1, 1
  SUB r12, r12, r1
  JNZ r12, loop_0
  LDI r6, 15
loop_1:
  ADDI r8, r15, 219
  LDI r14, 1
  SUB r6, r6, r14
  JNZ r6, loop_1
  HALT
