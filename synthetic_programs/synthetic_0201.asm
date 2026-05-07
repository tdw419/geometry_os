; Synthetic GeOS Program
; initialization
LDI r19, 699
LDI r16, 357
; main loop
loop_0:
  LDI r4, 16711935
  FILL r4
CIRCLE r26, r6, r14, r29
RECTF r3, r5, r19, r4, r6
  FRAME
  JMP loop_0