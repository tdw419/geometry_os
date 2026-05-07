; counted animation
; initialization
  LDI r0, 128
  LDI r30, 1985
  LDI r10, 128
  LDI r1, 239
  LDI r2, 10
  LDI r8, 2571
  LDI r15, 256
  LDI r0, 0xD75C4E
loop_0:
  SUBI r9, r10, 145
  LDI r6, 1
  SUB r0, r0, r6
  JNZ r0, loop_0
  HALT
