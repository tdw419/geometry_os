; Synthetic GeOS Program
; initialization
LDI r23, 757
LDI r5, 909
LDI r3, 453
; main loop
loop_0:
  LDI r20, 16711680
  FILL r20
LINE r26, r29, r3, r2, r19
RECTF r18, r22, r9, r6, r31
LINE r1, r11, r21, r26, r18
  FRAME
  JMP loop_0