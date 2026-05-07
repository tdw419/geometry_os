; Synthetic GeOS Program
; initialization
LDI r3, 884
LDI r20, 811
LDI r16, 890
LDI r13, 697
LDI r26, 181
LDI r25, 240
; main loop
loop_0:
  LDI r6, 255
  FILL r6
CIRCLE r6, r22, r7, r1
PSET r30, r11, r1
LINE r12, r20, r14, r1, r12
  FRAME
  JMP loop_0