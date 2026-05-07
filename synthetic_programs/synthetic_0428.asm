; Synthetic GeOS Program
; initialization
LDI r18, 548
LDI r11, 462
LDI r16, 217
LDI r19, 528
; main loop
loop_0:
  LDI r31, 65535
  FILL r31
RECTF r10, r23, r16, r16, r28
CIRCLE r2, r2, r1, r16
LINE r9, r27, r7, r22, r13
  CMP r3, r16
  JZ r0, loop_0
  FRAME
  JMP loop_0