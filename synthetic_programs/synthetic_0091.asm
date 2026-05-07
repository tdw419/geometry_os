; Synthetic GeOS Program
; initialization
LDI r15, 321
LDI r16, 118
LDI r21, 130
LDI r26, 194
LDI r24, 709
; main loop
loop_0:
  LDI r29, 16711935
  FILL r29
CIRCLE r28, r12, r28, r18
RECTF r10, r15, r0, r13, r23
PSET r0, r4, r10
  FRAME
  JMP loop_0