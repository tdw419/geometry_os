; Synthetic GeOS Program
; initialization
LDI r26, 255
LDI r27, 835
LDI r27, 70
; main loop
loop_0:
  LDI r20, 8947848
  FILL r20
RECTF r10, r7, r22, r9, r25
  CMP r10, r24
  JZ r0, loop_0
  FRAME
  JMP loop_0