; Synthetic GeOS Program
; initialization
LDI r9, 901
LDI r20, 604
LDI r13, 752
LDI r12, 133
; main loop
loop_0:
  LDI r19, 65535
  FILL r19
RECTF r2, r26, r16, r31, r3
  FRAME
  JMP loop_0