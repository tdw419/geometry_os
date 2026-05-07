; Synthetic GeOS Program
; initialization
LDI r4, 60
LDI r25, 911
LDI r12, 452
; main loop
loop_0:
  LDI r14, 65535
  FILL r14
PSET r13, r17, r26
PSET r27, r30, r1
  FRAME
  JMP loop_0