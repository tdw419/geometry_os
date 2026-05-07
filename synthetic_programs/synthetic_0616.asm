; Synthetic GeOS Program
; initialization
LDI r8, 499
LDI r6, 756
LDI r6, 205
LDI r2, 328
; main loop
loop_0:
  LDI r25, 0
  FILL r25
PSET r17, r24, r7
CIRCLE r15, r7, r19, r6
  CMP r3, r30
  JZ r0, loop_0
  FRAME
  JMP loop_0