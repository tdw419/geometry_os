; Synthetic GeOS Program
; initialization
LDI r4, 912
LDI r26, 34
; main loop
loop_0:
  LDI r31, 65280
  FILL r31
CIRCLE r18, r8, r30, r2
CIRCLE r1, r29, r24, r0
  CMP r11, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0