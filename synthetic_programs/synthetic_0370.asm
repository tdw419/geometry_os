; Synthetic GeOS Program
; initialization
LDI r27, 276
LDI r19, 0x0000FF
; main loop
loop_0:
  LDI r23, 0
  FILL r23
CIRCLE r3, r7, r24, r27
  CMP r10, r19
  JZ r0, loop_0
  FRAME
  JMP loop_0