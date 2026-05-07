; Synthetic GeOS Program
; initialization
LDI r29, 389
LDI r8, 594
LDI r12, 529
; main loop
loop_0:
  LDI r28, 65535
  FILL r28
RECTF r23, r26, r18, r20, r25
PSET r20, r18, r27
PSET r25, r6, r10
  CMP r4, r14
  JZ r0, loop_0
  FRAME
  JMP loop_0