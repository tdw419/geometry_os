; Synthetic GeOS Program
; initialization
LDI r27, 0x00FF00
LDI r28, 136
LDI r24, 1013
LDI r22, 592
LDI r23, 737
LDI r29, 0x00FFFF
; main loop
loop_0:
  LDI r21, 16776960
  FILL r21
RECTF r23, r24, r1, r22, r22
RECTF r18, r12, r0, r11, r20
RECTF r15, r4, r11, r12, r28
  FRAME
  JMP loop_0