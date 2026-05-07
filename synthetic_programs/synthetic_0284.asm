; Synthetic GeOS Program
; initialization
LDI r21, 729
LDI r7, 280
; main loop
loop_0:
  LDI r27, 16711935
  FILL r27
PSET r12, r17, r12
PSET r20, r7, r9
CIRCLE r22, r15, r17, r31
  CMP r3, r3
  JZ r0, loop_0
  FRAME
  JMP loop_0