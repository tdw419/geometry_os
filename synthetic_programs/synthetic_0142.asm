; Synthetic GeOS Program
; initialization
LDI r21, 22
LDI r23, 780
LDI r0, 418
LDI r18, 233
; main loop
loop_0:
  LDI r13, 0
  FILL r13
RECTF r27, r4, r2, r5, r31
LINE r16, r16, r1, r1, r28
  CMP r6, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0