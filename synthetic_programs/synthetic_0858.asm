; Synthetic GeOS Program
; initialization
LDI r17, 830
LDI r5, 364
LDI r28, 244
LDI r25, 90
LDI r4, 606
; main loop
loop_0:
  LDI r16, 16711935
  FILL r16
RECTF r27, r13, r4, r19, r10
CIRCLE r17, r18, r31, r4
CIRCLE r21, r17, r30, r11
  CMP r22, r23
  JZ r0, loop_0
  FRAME
  JMP loop_0