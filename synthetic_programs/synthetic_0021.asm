; Synthetic GeOS Program
; initialization
LDI r28, 511
LDI r11, 0x0000FF
LDI r24, 158
; main loop
loop_0:
  LDI r25, 8947848
  FILL r25
LINE r5, r6, r5, r5, r15
LINE r22, r2, r15, r2, r5
  CMP r17, r24
  JZ r0, loop_0
  FRAME
  JMP loop_0