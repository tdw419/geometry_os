; Synthetic GeOS Program
; initialization
LDI r31, 329
LDI r12, 140
LDI r31, 354
LDI r8, 67
; main loop
loop_0:
  LDI r7, 8947848
  FILL r7
PSET r22, r29, r6
CIRCLE r4, r7, r3, r23
  CMP r29, r13
  JZ r0, loop_0
  FRAME
  JMP loop_0