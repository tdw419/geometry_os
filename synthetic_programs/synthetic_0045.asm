; Synthetic GeOS Program
; initialization
LDI r16, 414
LDI r16, 822
; main loop
loop_0:
  LDI r8, 0
  FILL r8
PSET r20, r10, r12
CIRCLE r30, r18, r16, r29
  FRAME
  JMP loop_0