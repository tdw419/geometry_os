; Synthetic GeOS Program
; initialization
LDI r10, 0x00FF00
LDI r27, 75
LDI r18, 1012
; main loop
loop_0:
  LDI r10, 16711935
  FILL r10
LINE r26, r18, r9, r31, r6
CIRCLE r25, r23, r31, r11
  CMP r30, r10
  JZ r0, loop_0
  FRAME
  JMP loop_0