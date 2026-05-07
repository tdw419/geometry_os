; Synthetic GeOS Program
; initialization
LDI r13, 310
LDI r1, 729
LDI r14, 39
LDI r8, 859
; main loop
loop_0:
  LDI r0, 65535
  FILL r0
CIRCLE r12, r20, r29, r18
PSET r25, r12, r0
  FRAME
  JMP loop_0