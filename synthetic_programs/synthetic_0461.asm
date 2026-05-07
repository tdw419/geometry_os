; Synthetic GeOS Program
; initialization
LDI r2, 1011
LDI r31, 0x0000FF
; main loop
loop_0:
  LDI r22, 0
  FILL r22
RECTF r1, r25, r15, r13, r7
  CMP r26, r13
  JZ r0, loop_0
  FRAME
  JMP loop_0