; counted animation
; initialization
  LDI r6, 4
  LDI r1, 0x39C44D
  LDI r4, 1877
  LDI r2, 2818
  LDI r14, 0xC5BFD1
loop_0:
  OR r13, r7, r14
  LDI r10, 1
  SUB r14, r14, r10
  JNZ r14, loop_0
  HALT
