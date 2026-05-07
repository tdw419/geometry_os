; Synthetic GeOS Program
; initialization
LDI r1, 528
LDI r24, 0x0000FF
LDI r14, 823
LDI r28, 232
; main loop
loop_0:
  LDI r24, 16711935
  FILL r24
PSET r20, r13, r15
  CMP r28, r16
  JZ r0, loop_0
  FRAME
  JMP loop_0