; Synthetic GeOS Program
; initialization
LDI r19, 565
LDI r28, 552
LDI r23, 308
LDI r3, 847
; main loop
loop_0:
  LDI r29, 16777215
  FILL r29
CIRCLE r17, r20, r26, r18
CIRCLE r22, r26, r28, r16
RECTF r23, r5, r18, r23, r11
  CMP r24, r21
  JZ r0, loop_0
  FRAME
  JMP loop_0