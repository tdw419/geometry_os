; Synthetic GeOS Program
; initialization
LDI r19, 0xFFFF00
LDI r31, 791
LDI r23, 609
LDI r24, 262
LDI r24, 61
LDI r13, 832
; main loop
loop_0:
  LDI r23, 255
  FILL r23
CIRCLE r27, r20, r17, r15
LINE r14, r31, r25, r0, r22
LINE r23, r0, r19, r2, r11
  CMP r27, r18
  JZ r0, loop_0
  FRAME
  JMP loop_0