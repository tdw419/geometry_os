; Synthetic GeOS Program
; initialization
LDI r5, 0x00FF00
LDI r3, 0x0000FF
LDI r6, 682
LDI r24, 220
LDI r28, 932
; arithmetic section
SUB r26, r24, r21
LDI r9, 493
ADD r5, r23, r9
ADD r13, r14, r24
SUB r3, r19, r28
; main loop
loop_0:
  LDI r23, 16776960
  FILL r23
LINE r26, r28, r28, r5, r26
CIRCLE r26, r21, r12, r18
  FRAME
  JMP loop_0