; Synthetic GeOS Program
; initialization
LDI r11, 700
LDI r26, 0x0000FF
LDI r10, 441
LDI r1, 234
LDI r20, 116
; main loop
loop_0:
  LDI r24, 16711680
  FILL r24
PSET r17, r20, r13
CIRCLE r28, r17, r19, r16
LINE r5, r31, r4, r5, r16
  CMP r12, r13
  JZ r0, loop_0
  FRAME
  JMP loop_0