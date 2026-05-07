; Synthetic GeOS Program
; initialization
LDI r19, 659
LDI r18, 335
; arithmetic section
LDI r24, 111
ADD r31, r0, r12
SUB r5, r31, r31
ADD r30, r10, r5
; main loop
loop_0:
  LDI r21, 16776960
  FILL r21
CIRCLE r21, r18, r26, r0
RECTF r1, r0, r28, r17, r23
  CMP r0, r29
  JZ r0, loop_0
  FRAME
  JMP loop_0