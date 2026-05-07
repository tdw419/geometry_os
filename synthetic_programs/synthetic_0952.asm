; Synthetic GeOS Program
; initialization
LDI r6, 464
LDI r19, 667
LDI r31, 953
LDI r12, 456
LDI r12, 602
LDI r6, 931
; main loop
loop_0:
  LDI r9, 65280
  FILL r9
CIRCLE r22, r26, r23, r10
LINE r0, r11, r9, r0, r31
  CMP r22, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0