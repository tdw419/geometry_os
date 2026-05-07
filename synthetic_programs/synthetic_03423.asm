; counted animation
; initialization
  LDI r13, 1
  LDI r6, 8
  LDI r12, 127
  LDI r30, 25
loop_0:
  LDI r8, 1562
  LDI r6, 569
  LDI r10, 1907
  WPIXEL
  LDI r8, 1
  SUB r30, r30, r8
  JNZ r30, loop_0
  LDI r3, 64
loop_1:
  OR r12, r28, r18
  LDI r4, 256
  LDI r18, 0
  LDI r14, 1392
  WPIXEL
  LDI r0, 1
  SUB r3, r3, r0
  JNZ r3, loop_1
  HALT
