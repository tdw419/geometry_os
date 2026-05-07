; Synthetic GeOS Program
; initialization
LDI r14, 298
LDI r4, 144
LDI r4, 0xFF00FF
LDI r6, 114
LDI r30, 876
LDI r28, 176
; main loop
loop_0:
  LDI r8, 0
  FILL r8
CIRCLE r9, r25, r6, r28
  CMP r14, r26
  JZ r0, loop_0
  FRAME
  JMP loop_0