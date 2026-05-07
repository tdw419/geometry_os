; Synthetic GeOS Program
; initialization
LDI r25, 90
LDI r16, 489
LDI r30, 657
; main loop
loop_0:
  LDI r4, 65535
  FILL r4
RECTF r21, r8, r5, r6, r12
RECTF r26, r25, r30, r27, r14
  CMP r22, r1
  JZ r0, loop_0
  FRAME
  JMP loop_0