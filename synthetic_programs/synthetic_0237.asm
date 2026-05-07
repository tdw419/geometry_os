; Synthetic GeOS Program
; initialization
LDI r31, 801
LDI r15, 588
; main loop
loop_0:
  LDI r27, 65280
  FILL r27
CIRCLE r23, r5, r5, r31
RECTF r7, r30, r22, r1, r4
LINE r20, r18, r3, r26, r11
  CMP r19, r2
  JZ r0, loop_0
  FRAME
  JMP loop_0