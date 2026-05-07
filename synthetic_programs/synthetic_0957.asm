; Synthetic GeOS Program
; initialization
LDI r15, 165
LDI r22, 0xFF00FF
LDI r23, 294
; main loop
loop_0:
  LDI r20, 8947848
  FILL r20
RECTF r19, r18, r18, r5, r9
PSET r29, r12, r9
RECTF r6, r16, r19, r29, r4
  CMP r16, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0