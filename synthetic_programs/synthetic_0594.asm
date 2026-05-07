; Synthetic GeOS Program
; initialization
LDI r25, 0x0000FF
LDI r2, 0x0000FF
LDI r0, 687
LDI r3, 417
LDI r31, 536
LDI r12, 964
; arithmetic section
ADD r18, r16, r29
SUB r18, r20, r23
ADD r18, r31, r6
ADD r22, r21, r9
; main loop
loop_0:
  LDI r24, 16776960
  FILL r24
RECTF r26, r2, r28, r15, r29
  FRAME
  JMP loop_0