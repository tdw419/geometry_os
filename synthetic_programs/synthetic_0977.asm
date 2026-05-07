; Synthetic GeOS Program
; initialization
LDI r4, 757
LDI r2, 105
; main loop
loop_0:
  LDI r25, 65280
  FILL r25
LINE r0, r1, r15, r2, r3
LINE r19, r11, r4, r20, r0
RECTF r2, r9, r21, r15, r26
  FRAME
  JMP loop_0