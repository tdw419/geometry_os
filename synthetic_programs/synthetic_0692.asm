; Synthetic GeOS Program
; initialization
LDI r1, 345
LDI r9, 181
LDI r24, 990
LDI r22, 568
; main loop
loop_0:
  LDI r16, 16777215
  FILL r16
LINE r9, r17, r8, r18, r2
  CMP r22, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0