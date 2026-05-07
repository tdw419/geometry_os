; Synthetic GeOS Program
; initialization
LDI r11, 438
LDI r24, 734
LDI r29, 301
; main loop
loop_0:
  LDI r27, 255
  FILL r27
CIRCLE r17, r0, r26, r8
  CMP r17, r9
  JZ r0, loop_0
  FRAME
  JMP loop_0