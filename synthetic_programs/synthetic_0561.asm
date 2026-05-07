; Synthetic GeOS Program
; initialization
LDI r1, 945
LDI r19, 645
; main loop
loop_0:
  LDI r29, 65535
  FILL r29
PSET r3, r15, r4
PSET r12, r27, r31
  CMP r15, r23
  JZ r0, loop_0
  FRAME
  JMP loop_0