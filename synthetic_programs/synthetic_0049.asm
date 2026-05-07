; Synthetic GeOS Program
; initialization
LDI r18, 946
LDI r2, 0xFF00FF
; main loop
loop_0:
  LDI r23, 255
  FILL r23
RECTF r30, r19, r15, r19, r9
LINE r8, r19, r18, r16, r14
RECTF r20, r27, r27, r25, r1
  CMP r18, r14
  JZ r0, loop_0
  FRAME
  JMP loop_0