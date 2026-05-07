; Synthetic GeOS Program
; initialization
LDI r13, 0xFFFFFF
LDI r30, 791
; main loop
loop_0:
  LDI r17, 16711680
  FILL r17
PSET r23, r15, r21
PSET r10, r20, r27
PSET r3, r13, r14
  FRAME
  JMP loop_0