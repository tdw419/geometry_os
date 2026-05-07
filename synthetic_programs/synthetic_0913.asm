; Synthetic GeOS Program
; initialization
LDI r20, 583
LDI r24, 928
LDI r11, 583
; main loop
loop_0:
  LDI r27, 255
  FILL r27
CIRCLE r15, r30, r6, r12
RECTF r24, r7, r30, r14, r25
  FRAME
  JMP loop_0