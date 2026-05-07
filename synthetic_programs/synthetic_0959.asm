; Synthetic GeOS Program
; initialization
LDI r28, 700
LDI r21, 531
LDI r22, 897
LDI r28, 782
LDI r4, 0xFF00FF
; main loop
loop_0:
  LDI r14, 65535
  FILL r14
PSET r9, r31, r26
PSET r7, r12, r6
  CMP r31, r15
  JZ r0, loop_0
  FRAME
  JMP loop_0