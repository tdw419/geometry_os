; Synthetic GeOS Program
; initialization
LDI r10, 811
LDI r16, 28
LDI r7, 928
LDI r27, 0xFF0000
LDI r15, 406
; main loop
loop_0:
  LDI r5, 16777215
  FILL r5
PSET r5, r1, r10
PSET r31, r27, r29
  CMP r12, r1
  JZ r0, loop_0
  FRAME
  JMP loop_0