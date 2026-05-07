; Synthetic GeOS Program
; initialization
LDI r10, 629
LDI r9, 264
; arithmetic section
SUB r4, r6, r27
LDI r17, 649
LDI r2, 870
LDI r0, 202
; main loop
loop_0:
  LDI r24, 16711935
  FILL r24
RECTF r22, r1, r3, r9, r6
PSET r14, r3, r27
CIRCLE r0, r17, r1, r15
  CMP r14, r12
  JZ r0, loop_0
  FRAME
  JMP loop_0