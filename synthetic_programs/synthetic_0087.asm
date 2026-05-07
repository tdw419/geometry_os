; Synthetic GeOS Program
; initialization
LDI r19, 96
LDI r28, 696
; main loop
loop_0:
  LDI r25, 16711680
  FILL r25
CIRCLE r31, r23, r6, r29
PSET r5, r9, r23
  CMP r23, r30
  JZ r0, loop_0
  FRAME
  JMP loop_0