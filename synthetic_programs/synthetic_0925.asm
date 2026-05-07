; Synthetic GeOS Program
; initialization
LDI r16, 0x00FF00
LDI r30, 597
LDI r16, 408
LDI r10, 740
LDI r22, 0xFFFFFF
LDI r2, 849
; arithmetic section
SUB r9, r18, r20
LDI r17, 482
SUB r1, r31, r16
ADD r8, r26, r20
ADD r29, r6, r12
SUB r5, r4, r23
; main loop
loop_0:
  LDI r21, 16776960
  FILL r21
RECTF r2, r2, r3, r8, r2
CIRCLE r29, r19, r28, r28
LINE r24, r18, r9, r9, r1
  FRAME
  JMP loop_0