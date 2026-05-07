; Synthetic GeOS Program
; initialization
LDI r22, 949
LDI r13, 240
; main loop
loop_0:
  LDI r26, 65280
  FILL r26
CIRCLE r2, r4, r18, r3
  FRAME
  JMP loop_0