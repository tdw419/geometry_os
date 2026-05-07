; Synthetic GeOS Program
; initialization
LDI r10, 722
LDI r23, 397
LDI r20, 50
LDI r21, 955
; arithmetic section
ADD r23, r21, r17
SUB r30, r20, r0
ADD r27, r0, r25
SUB r28, r14, r29
; main loop
loop_0:
  LDI r19, 16777215
  FILL r19
RECTF r27, r8, r5, r27, r9
CIRCLE r31, r22, r16, r20
  CMP r24, r29
  JZ r0, loop_0
  FRAME
  JMP loop_0