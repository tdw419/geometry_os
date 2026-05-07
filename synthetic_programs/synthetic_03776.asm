; counted animation
; initialization
  LDI r13, 0x60B5FF
  LDI r4, 4
  LDI r7, 37
loop_0:
  CMPI r10, r0, 163
  LDI r26, 1
  SUB r7, r7, r26
  JNZ r7, loop_0
  HALT
