; Synthetic GeOS Program
; initialization
LDI r22, 557
LDI r8, 920
LDI r25, 516
LDI r19, 723
LDI r20, 550
; main loop
loop_0:
  LDI r31, 255
  FILL r31
RECTF r25, r7, r24, r2, r11
RECTF r12, r27, r12, r0, r25
  FRAME
  JMP loop_0