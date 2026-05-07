; Synthetic GeOS Program
; initialization
LDI r1, 881
LDI r11, 770
LDI r17, 998
LDI r21, 0x00FF00
; main loop
loop_0:
  LDI r15, 0
  FILL r15
LINE r14, r6, r23, r18, r2
CIRCLE r23, r6, r1, r28
RECTF r5, r14, r26, r1, r20
  CMP r23, r16
  JZ r0, loop_0
  FRAME
  JMP loop_0