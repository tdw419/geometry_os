; counted animation
; initialization
  LDI r3, 128
  LDI r14, 128
  LDI r10, 0x3FCB09
  LDI r1, 3355
  LDI r12, 1713
  LDI r2, 0x918746
loop_0:
  CMPI r10, r9, 229
  LDI r6, 1
  SUB r2, r2, r6
  JNZ r2, loop_0
  HALT
