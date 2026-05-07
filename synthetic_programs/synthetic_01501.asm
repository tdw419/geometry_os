; counted animation
; initialization
  LDI r9, 3185
  LDI r25, 0
  LDI r22, 2313
  LDI r3, 1919
  LDI r2, 570
  LDI r0, 195
  LDI r10, 25
loop_0:
  CMPI r10, r15, 0
  CMPI r7, r1, 219
  LDI r5, 1
  SUB r10, r10, r5
  JNZ r10, loop_0
  LDI r3, 256
loop_1:
  SUBI r2, r14, 83
  LDI r13, 1
  SUB r3, r3, r13
  JNZ r3, loop_1
  HALT
