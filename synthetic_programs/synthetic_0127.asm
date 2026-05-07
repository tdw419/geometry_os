; Synthetic GeOS Program
; initialization
LDI r27, 919
LDI r18, 0x0000FF
LDI r17, 0xFF00FF
; main loop
loop_0:
  LDI r13, 65280
  FILL r13
CIRCLE r3, r1, r23, r23
PSET r14, r13, r18
RECTF r21, r31, r12, r25, r4
  FRAME
  JMP loop_0