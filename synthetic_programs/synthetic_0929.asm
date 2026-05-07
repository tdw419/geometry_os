; Synthetic GeOS Program
; initialization
LDI r24, 7
LDI r23, 804
LDI r22, 849
LDI r9, 377
LDI r20, 58
LDI r1, 697
; arithmetic section
ADD r17, r20, r29
LDI r9, 292
LDI r27, 323
LDI r24, 191
LDI r3, 0xFF00FF
SUB r30, r5, r20
SUB r21, r1, r8
; main loop
loop_0:
  LDI r31, 65535
  FILL r31
CIRCLE r19, r1, r31, r29
RECTF r6, r18, r16, r21, r9
  FRAME
  JMP loop_0