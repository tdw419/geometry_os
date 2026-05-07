; Synthetic GeOS Program
; initialization
LDI r29, 928
LDI r30, 75
LDI r23, 353
; main loop
loop_0:
  LDI r24, 16711680
  FILL r24
LINE r1, r10, r14, r3, r2
CIRCLE r11, r21, r2, r22
LINE r25, r11, r30, r3, r18
  FRAME
  JMP loop_0