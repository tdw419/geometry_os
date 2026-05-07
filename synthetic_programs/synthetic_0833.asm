; Synthetic GeOS Program
; initialization
LDI r15, 349
LDI r30, 1
LDI r25, 0x0000FF
LDI r16, 320
LDI r18, 322
; main loop
loop_0:
  LDI r30, 8947848
  FILL r30
LINE r27, r4, r13, r26, r16
LINE r3, r21, r2, r14, r13
RECTF r27, r14, r2, r5, r1
  CMP r23, r5
  JZ r0, loop_0
  FRAME
  JMP loop_0