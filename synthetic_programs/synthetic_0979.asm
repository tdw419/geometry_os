; Synthetic GeOS Program
; initialization
LDI r6, 336
LDI r22, 674
LDI r10, 208
; main loop
loop_0:
  LDI r24, 0
  FILL r24
RECTF r19, r9, r21, r10, r6
  FRAME
  JMP loop_0