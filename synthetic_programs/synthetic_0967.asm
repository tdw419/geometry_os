; Synthetic GeOS Program
; initialization
LDI r29, 0xFF00FF
LDI r18, 114
LDI r24, 877
LDI r18, 491
LDI r25, 333
; main loop
loop_0:
  LDI r29, 16776960
  FILL r29
RECTF r20, r19, r31, r22, r9
LINE r3, r6, r2, r7, r13
  CMP r24, r23
  JZ r0, loop_0
  FRAME
  JMP loop_0