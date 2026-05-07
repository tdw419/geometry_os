; Synthetic GeOS Program
; initialization
LDI r12, 334
LDI r12, 0x00FF00
LDI r5, 0
LDI r8, 0xFF00FF
LDI r13, 905
LDI r3, 580
; main loop
loop_0:
  LDI r21, 65280
  FILL r21
RECTF r24, r23, r12, r30, r14
CIRCLE r26, r0, r13, r13
PSET r28, r27, r8
  CMP r22, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0