; Synthetic GeOS Program
; initialization
LDI r16, 0xFFFF00
LDI r2, 387
LDI r28, 323
; main loop
loop_0:
  LDI r28, 65535
  FILL r28
CIRCLE r30, r5, r25, r6
RECTF r27, r30, r17, r12, r16
  CMP r15, r28
  JZ r0, loop_0
  FRAME
  JMP loop_0