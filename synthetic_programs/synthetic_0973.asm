; Synthetic GeOS Program
; initialization
LDI r0, 604
LDI r16, 407
LDI r13, 516
LDI r26, 88
LDI r12, 9
LDI r28, 432
; main loop
loop_0:
  LDI r0, 16776960
  FILL r0
RECTF r0, r20, r3, r26, r8
CIRCLE r28, r14, r17, r3
  CMP r31, r16
  JZ r0, loop_0
  FRAME
  JMP loop_0