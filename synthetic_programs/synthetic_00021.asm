; counted animation
; initialization
  LDI r9, 330
  LDI r10, 0x7F1688
  LDI r1, 2
loop_0:
  CMPI r7, r3, 0
  LDI r7, 1
  SUB r1, r1, r7
  JNZ r1, loop_0
  LDI r12, 41
loop_1:
  MOD r2, r14, r10
  LDI r14, 1
  SUB r12, r12, r14
  JNZ r12, loop_1
  HALT
