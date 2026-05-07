; Synthetic GeOS Program
; initialization
LDI r28, 0xFFFF00
LDI r10, 37
; main loop
loop_0:
  LDI r5, 65280
  FILL r5
LINE r22, r29, r9, r24, r15
  FRAME
  JMP loop_0