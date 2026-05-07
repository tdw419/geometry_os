; Synthetic GeOS Program
; initialization
LDI r4, 0x00FF00
LDI r7, 894
; main loop
loop_0:
  LDI r19, 16711935
  FILL r19
LINE r7, r28, r5, r12, r30
  FRAME
  JMP loop_0