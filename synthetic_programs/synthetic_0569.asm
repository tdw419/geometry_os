; Synthetic GeOS Program
; initialization
LDI r20, 163
LDI r3, 705
LDI r21, 355
; arithmetic section
ADD r19, r5, r25
ADD r5, r7, r6
SUB r6, r29, r21
SUB r8, r31, r27
; main loop
loop_0:
  LDI r4, 0
  FILL r4
RECTF r4, r1, r8, r27, r21
CIRCLE r26, r3, r16, r19
CIRCLE r1, r14, r6, r26
  FRAME
  JMP loop_0