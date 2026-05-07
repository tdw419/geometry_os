; Synthetic GeOS Program
; initialization
LDI r29, 673
LDI r20, 162
; main loop
loop_0:
  LDI r23, 16776960
  FILL r23
LINE r24, r7, r11, r11, r23
LINE r12, r20, r17, r29, r10
  FRAME
  JMP loop_0