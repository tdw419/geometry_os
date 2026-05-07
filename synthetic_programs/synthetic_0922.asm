; Synthetic GeOS Program
; initialization
LDI r10, 72
LDI r2, 845
LDI r16, 0xFFFFFF
LDI r9, 358
LDI r27, 60
; main loop
loop_0:
  LDI r12, 65535
  FILL r12
PSET r5, r16, r26
LINE r5, r8, r18, r18, r31
  CMP r6, r19
  JZ r0, loop_0
  FRAME
  JMP loop_0