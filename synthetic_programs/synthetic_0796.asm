; Synthetic GeOS Program
; initialization
LDI r4, 117
LDI r28, 75
LDI r3, 676
LDI r10, 235
; arithmetic section
ADD r13, r27, r21
ADD r26, r11, r3
ADD r2, r20, r31
SUB r3, r22, r0
SUB r24, r11, r7
LDI r24, 774
LDI r23, 937
LDI r9, 416
; main loop
loop_0:
  LDI r31, 16711935
  FILL r31
LINE r0, r30, r7, r16, r13
RECTF r5, r29, r10, r25, r5
LINE r5, r13, r25, r6, r9
  FRAME
  JMP loop_0