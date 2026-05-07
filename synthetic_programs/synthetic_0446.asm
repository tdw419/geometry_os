; Synthetic GeOS Program
; initialization
LDI r4, 677
LDI r25, 639
; arithmetic section
ADD r13, r21, r10
SUB r6, r25, r25
LDI r23, 0xFF00FF
SUB r21, r9, r7
LDI r0, 345
LDI r13, 611
ADD r5, r12, r0
ADD r21, r13, r7
; main loop
loop_0:
  LDI r15, 16776960
  FILL r15
RECTF r9, r9, r24, r9, r15
CIRCLE r23, r24, r15, r20
  CMP r29, r20
  JZ r0, loop_0
  FRAME
  JMP loop_0