; Synthetic GeOS Program
; initialization
LDI r13, 0xFF00FF
LDI r28, 702
; main loop
loop_0:
  LDI r13, 255
  FILL r13
CIRCLE r6, r6, r27, r3
CIRCLE r26, r27, r27, r11
  CMP r22, r31
  JZ r0, loop_0
  FRAME
  JMP loop_0