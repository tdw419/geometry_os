; counted animation
; initialization
  LDI r15, 255
  LDI r6, 1
  LDI r12, 12
loop_0:
  SUB r14, r6, r10
  ADD r12, r3, r21
  LDI r13, 1
  SUB r12, r12, r13
  JNZ r12, loop_0
  HALT
