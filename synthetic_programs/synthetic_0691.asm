; Synthetic GeOS Program
; initialization
LDI r17, 588
LDI r16, 77
LDI r15, 757
; main loop
loop_0:
  LDI r9, 0
  FILL r9
LINE r15, r15, r27, r18, r21
PSET r27, r19, r8
  CMP r23, r31
  JZ r0, loop_0
  FRAME
  JMP loop_0