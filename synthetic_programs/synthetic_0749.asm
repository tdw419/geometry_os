; Synthetic GeOS Program
; initialization
LDI r19, 307
LDI r6, 123
; main loop
loop_0:
  LDI r5, 16711680
  FILL r5
PSET r1, r17, r24
LINE r15, r19, r6, r9, r8
LINE r3, r11, r22, r23, r5
  CMP r14, r23
  JZ r0, loop_0
  FRAME
  JMP loop_0