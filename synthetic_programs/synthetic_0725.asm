; Synthetic GeOS Program
; initialization
LDI r26, 0x888888
LDI r28, 89
LDI r8, 832
; main loop
loop_0:
  LDI r4, 65280
  FILL r4
CIRCLE r25, r18, r18, r19
  FRAME
  JMP loop_0