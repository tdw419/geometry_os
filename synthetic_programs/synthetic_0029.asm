; Synthetic GeOS Program
; initialization
LDI r19, 761
LDI r4, 0x0000FF
; main loop
loop_0:
  LDI r14, 8947848
  FILL r14
RECTF r20, r22, r0, r16, r14
  FRAME
  JMP loop_0