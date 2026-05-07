; Synthetic GeOS Program
; initialization
LDI r23, 352
LDI r5, 194
; main loop
loop_0:
  LDI r17, 0
  FILL r17
CIRCLE r18, r27, r25, r31
  CMP r19, r14
  JZ r0, loop_0
  FRAME
  JMP loop_0