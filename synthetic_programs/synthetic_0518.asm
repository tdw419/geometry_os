; Synthetic GeOS Program
; initialization
LDI r27, 742
LDI r15, 526
; main loop
loop_0:
  LDI r2, 16777215
  FILL r2
LINE r24, r20, r5, r20, r3
CIRCLE r16, r16, r28, r3
  FRAME
  JMP loop_0