; counted animation
; initialization
  LDI r5, 255
  LDI r22, 10
  LDI r1, 64
loop_0:
  LDI r8, 1536
  LDI r13, 0
  LDI r7, 12
  LDI r13, 2034
  CIRCLE r8, r13, r7, r13
  LDI r7, 236
  LDI r13, 3160
  LDI r0, 10
  PSET r7, r13, r0
  LDI r3, 1
  SUB r1, r1, r3
  JNZ r1, loop_0
  HALT
