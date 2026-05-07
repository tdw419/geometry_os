; Synthetic GeOS Program
; initialization
LDI r26, 151
LDI r31, 45
; main loop
loop_0:
  LDI r8, 16711935
  FILL r8
CIRCLE r28, r19, r14, r22
CIRCLE r5, r28, r26, r24
PSET r18, r14, r28
  FRAME
  JMP loop_0