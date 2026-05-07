; Synthetic GeOS Program
; initialization
LDI r20, 544
LDI r5, 313
; main loop
loop_0:
  LDI r5, 16711935
  FILL r5
PSET r19, r8, r27
CIRCLE r9, r15, r4, r2
CIRCLE r10, r8, r1, r18
  CMP r23, r6
  JZ r0, loop_0
  FRAME
  JMP loop_0