; Synthetic GeOS Program
; initialization
LDI r9, 697
LDI r15, 76
LDI r9, 629
LDI r9, 930
LDI r8, 161
LDI r5, 993
; main loop
loop_0:
  LDI r21, 0
  FILL r21
RECTF r21, r11, r19, r26, r3
CIRCLE r23, r20, r16, r4
  CMP r22, r12
  JZ r0, loop_0
  FRAME
  JMP loop_0