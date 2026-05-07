; Synthetic GeOS Program
; initialization
LDI r9, 0xFF00FF
LDI r21, 791
LDI r20, 0
LDI r13, 844
LDI r5, 258
LDI r12, 48
; main loop
loop_0:
  LDI r21, 16776960
  FILL r21
PSET r6, r20, r19
PSET r23, r31, r26
  FRAME
  JMP loop_0