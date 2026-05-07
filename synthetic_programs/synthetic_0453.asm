; Synthetic GeOS Program
; initialization
LDI r25, 0xFF00FF
LDI r5, 761
; main loop
loop_0:
  LDI r1, 255
  FILL r1
CIRCLE r29, r2, r22, r21
  FRAME
  JMP loop_0