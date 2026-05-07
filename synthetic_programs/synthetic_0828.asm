; Synthetic GeOS Program
; initialization
LDI r26, 0xFFFF00
LDI r3, 168
LDI r7, 426
; main loop
loop_0:
  LDI r1, 65280
  FILL r1
PSET r0, r15, r12
LINE r14, r31, r1, r29, r12
  CMP r8, r20
  JZ r0, loop_0
  FRAME
  JMP loop_0