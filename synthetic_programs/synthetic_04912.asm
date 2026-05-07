; mixed program
; initialization
  LDI r21, 1594
  LDI r4, 0xA70D0F
  LDI r14, 0xA7AE09
  LDI r24, 0xBA80F1
  SHR r0, r8, r1
  XOR r9, r21, r3
  SHL r0, r17, r19
  SHLI r2, r6, 3
  SHR r15, r2, r8
  SHL r5, r9, r14
  LDI r7, 32
loop_0:
  OR r12, r10, r15
  LDI r8, 1
  SUB r7, r7, r8
  JNZ r7, loop_0
  LDI r1, 256
loop_1:
  LDI r0, 3931
  LDI r8, 1
  LDI r14, 603
  LDI r6, 236
  CIRCLE r0, r8, r14, r6
  LDI r9, 1
  SUB r1, r1, r9
  JNZ r1, loop_1
  HALT
