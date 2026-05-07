; Synthetic GeOS Program
; initialization
LDI r24, 68
LDI r31, 144
LDI r0, 371
LDI r30, 915
LDI r26, 0xFFFFFF
; arithmetic section
ADD r17, r18, r5
ADD r23, r12, r7
SUB r29, r3, r2
SUB r22, r3, r23
ADD r21, r7, r5
; main loop
loop_0:
  LDI r6, 16776960
  FILL r6
CIRCLE r14, r7, r9, r28
RECTF r6, r17, r18, r1, r14
  CMP r19, r9
  JZ r0, loop_0
  FRAME
  JMP loop_0