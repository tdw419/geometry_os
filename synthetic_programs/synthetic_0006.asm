; Synthetic GeOS Program
; initialization
LDI r20, 0xFF0000
LDI r3, 287
LDI r26, 0xFF0000
LDI r23, 417
; main loop
loop_0:
  LDI r2, 16777215
  FILL r2
CIRCLE r27, r26, r19, r28
  CMP r19, r19
  JZ r0, loop_0
  FRAME
  JMP loop_0