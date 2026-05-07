; Synthetic GeOS Program
; initialization
LDI r30, 950
LDI r26, 38
; arithmetic section
SUB r5, r19, r22
SUB r10, r2, r10
ADD r13, r27, r22
; main loop
loop_0:
  LDI r27, 8947848
  FILL r27
PSET r31, r5, r3
CIRCLE r22, r26, r28, r26
  FRAME
  JMP loop_0