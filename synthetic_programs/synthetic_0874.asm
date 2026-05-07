; Synthetic GeOS Program
; initialization
LDI r20, 259
LDI r12, 1014
; main loop
loop_0:
  LDI r31, 16777215
  FILL r31
CIRCLE r18, r9, r4, r24
PSET r19, r6, r9
CIRCLE r26, r0, r8, r12
  CMP r25, r0
  JZ r0, loop_0
  FRAME
  JMP loop_0