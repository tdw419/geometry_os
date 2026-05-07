; Synthetic GeOS Program
; initialization
LDI r31, 884
LDI r19, 735
LDI r1, 663
LDI r9, 342
LDI r16, 728
LDI r16, 554
; main loop
loop_0:
  LDI r26, 16776960
  FILL r26
LINE r22, r25, r20, r24, r2
CIRCLE r7, r26, r12, r26
PSET r22, r16, r0
  FRAME
  JMP loop_0