; Synthetic GeOS Program
; initialization
LDI r13, 0x0000FF
LDI r22, 394
LDI r28, 0xFFFF00
LDI r11, 941
LDI r4, 862
LDI r1, 838
; main loop
loop_0:
  LDI r23, 16711935
  FILL r23
LINE r22, r11, r27, r16, r4
LINE r28, r28, r27, r4, r26
PSET r31, r13, r3
  FRAME
  JMP loop_0