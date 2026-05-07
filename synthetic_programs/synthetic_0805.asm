; Synthetic GeOS Program
; initialization
LDI r17, 134
LDI r12, 682
LDI r5, 0x888888
LDI r20, 151
; main loop
loop_0:
  LDI r23, 16711680
  FILL r23
CIRCLE r4, r10, r30, r26
  CMP r0, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0