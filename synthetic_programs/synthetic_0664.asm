; Synthetic GeOS Program
; initialization
LDI r7, 419
LDI r19, 0x0000FF
; main loop
loop_0:
  LDI r11, 8947848
  FILL r11
RECTF r3, r8, r27, r28, r25
CIRCLE r28, r4, r15, r19
LINE r4, r21, r27, r28, r12
  CMP r11, r13
  JZ r0, loop_0
  FRAME
  JMP loop_0