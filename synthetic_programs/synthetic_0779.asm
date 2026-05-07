; Synthetic GeOS Program
; initialization
LDI r7, 515
LDI r18, 0xFF0000
; main loop
loop_0:
  LDI r27, 65280
  FILL r27
RECTF r28, r2, r22, r13, r24
  FRAME
  JMP loop_0