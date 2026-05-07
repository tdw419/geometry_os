; Synthetic GeOS Program
; initialization
LDI r4, 1007
LDI r0, 495
; main loop
loop_0:
  LDI r20, 16711935
  FILL r20
CIRCLE r13, r6, r23, r19
LINE r5, r31, r27, r9, r31
  FRAME
  JMP loop_0