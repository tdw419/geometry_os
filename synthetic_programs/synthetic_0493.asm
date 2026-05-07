; Synthetic GeOS Program
; initialization
LDI r24, 0xFF00FF
LDI r12, 206
LDI r3, 262
LDI r26, 0xFF00FF
LDI r15, 334
; arithmetic section
LDI r15, 601
LDI r11, 964
LDI r31, 875
; main loop
loop_0:
  LDI r27, 16776960
  FILL r27
RECTF r28, r19, r16, r21, r11
  CMP r6, r28
  JZ r0, loop_0
  FRAME
  JMP loop_0