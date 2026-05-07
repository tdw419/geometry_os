; Synthetic GeOS Program
; initialization
LDI r9, 932
LDI r29, 828
; main loop
loop_0:
  LDI r4, 16776960
  FILL r4
PSET r29, r16, r28
  FRAME
  JMP loop_0