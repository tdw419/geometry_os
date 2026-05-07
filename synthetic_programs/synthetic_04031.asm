; counted animation
; initialization
  LDI r8, 246
  LDI r7, 128
  LDI r3, 981
  LDI r4, 292
  LDI r8, 10
loop_0:
  SUB r5, r6, r7
  LDI r2, 1
  SUB r8, r8, r2
  JNZ r8, loop_0
  HALT
