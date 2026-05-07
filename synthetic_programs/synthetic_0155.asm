; Synthetic GeOS Program
; initialization
LDI r3, 0xFFFF00
LDI r8, 894
LDI r27, 154
LDI r31, 669
LDI r3, 937
LDI r29, 1011
; main loop
loop_0:
  LDI r10, 8947848
  FILL r10
PSET r29, r8, r4
RECTF r15, r19, r12, r2, r20
  CMP r9, r12
  JZ r0, loop_0
  FRAME
  JMP loop_0