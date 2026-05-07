; counted animation
; initialization
  LDI r0, 64
  LDI r13, 64
  LDI r12, 64
loop_0:
  CMPI r2, r5, 8
  SHL r7, r9, r14
  ANDI r7, r5, 255
  LDI r31, 1
  SUB r12, r12, r31
  JNZ r12, loop_0
  HALT
