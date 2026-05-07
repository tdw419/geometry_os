; Synthetic GeOS Program
; initialization
LDI r28, 1007
LDI r2, 687
LDI r15, 658
LDI r7, 386
LDI r22, 961
LDI r2, 293
; arithmetic section
LDI r16, 1003
SUB r16, r21, r29
LDI r14, 468
SUB r17, r20, r8
SUB r18, r16, r30
ADD r22, r10, r5
; main loop
loop_0:
  LDI r28, 16777215
  FILL r28
LINE r24, r13, r25, r30, r6
RECTF r12, r0, r10, r12, r23
  FRAME
  JMP loop_0