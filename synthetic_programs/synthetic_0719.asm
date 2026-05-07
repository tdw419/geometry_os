; Synthetic GeOS Program
; initialization
LDI r11, 401
LDI r18, 795
LDI r29, 758
; main loop
loop_0:
  LDI r18, 65280
  FILL r18
LINE r16, r17, r22, r20, r16
RECTF r31, r5, r23, r24, r20
RECTF r18, r12, r17, r19, r28
  CMP r31, r15
  JZ r0, loop_0
  FRAME
  JMP loop_0