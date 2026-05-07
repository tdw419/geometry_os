; Synthetic GeOS Program
; initialization
LDI r1, 430
LDI r13, 890
LDI r12, 190
; arithmetic section
SUB r29, r31, r27
SUB r6, r28, r3
ADD r19, r27, r2
SUB r15, r23, r8
LDI r10, 698
LDI r21, 297
ADD r28, r18, r4
SUB r20, r28, r9
; main loop
loop_0:
  LDI r19, 16776960
  FILL r19
CIRCLE r20, r3, r15, r21
LINE r27, r0, r4, r28, r3
  FRAME
  JMP loop_0