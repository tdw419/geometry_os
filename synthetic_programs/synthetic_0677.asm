; Synthetic GeOS Program
; initialization
LDI r26, 516
LDI r23, 542
; main loop
loop_0:
  LDI r1, 16777215
  FILL r1
LINE r1, r18, r11, r19, r7
PSET r31, r9, r2
CIRCLE r22, r31, r26, r22
  CMP r0, r14
  JZ r0, loop_0
  FRAME
  JMP loop_0