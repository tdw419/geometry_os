; Synthetic GeOS Program
; initialization
LDI r26, 924
LDI r7, 95
LDI r4, 644
; main loop
loop_0:
  LDI r4, 16711680
  FILL r4
RECTF r22, r25, r11, r16, r16
PSET r15, r15, r10
  FRAME
  JMP loop_0