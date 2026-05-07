; Synthetic GeOS Program
; initialization
LDI r24, 78
LDI r7, 320
LDI r29, 0xFFFF00
LDI r9, 53
LDI r18, 0xFF00FF
LDI r8, 1016
; main loop
loop_0:
  LDI r7, 0
  FILL r7
CIRCLE r7, r4, r18, r24
  CMP r30, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0