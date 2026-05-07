; Synthetic GeOS Program
; initialization
LDI r19, 120
LDI r11, 302
LDI r15, 0x000000
LDI r27, 219
; main loop
loop_0:
  LDI r18, 0
  FILL r18
LINE r23, r26, r6, r22, r29
PSET r7, r15, r25
  FRAME
  JMP loop_0