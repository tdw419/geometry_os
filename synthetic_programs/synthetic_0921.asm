; Synthetic GeOS Program
; initialization
LDI r22, 0x00FFFF
LDI r11, 0
LDI r15, 0xFF00FF
LDI r13, 341
LDI r4, 481
LDI r16, 227
; main loop
loop_0:
  LDI r6, 0
  FILL r6
LINE r23, r27, r19, r26, r28
CIRCLE r26, r28, r30, r2
  CMP r19, r12
  JZ r0, loop_0
  FRAME
  JMP loop_0