; Synthetic GeOS Program
; initialization
LDI r13, 0xFF00FF
LDI r13, 794
LDI r29, 377
; arithmetic section
ADD r10, r28, r6
LDI r31, 345
ADD r25, r11, r9
LDI r21, 100
LDI r20, 501
LDI r21, 840
ADD r28, r8, r11
; main loop
loop_0:
  LDI r19, 16711680
  FILL r19
RECTF r15, r27, r18, r29, r27
LINE r13, r5, r13, r10, r29
  FRAME
  JMP loop_0