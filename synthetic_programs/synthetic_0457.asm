; Synthetic GeOS Program
; initialization
LDI r29, 212
LDI r18, 627
LDI r1, 576
LDI r12, 741
LDI r8, 296
; main loop
loop_0:
  LDI r6, 16711680
  FILL r6
CIRCLE r3, r20, r8, r4
CIRCLE r27, r26, r14, r28
  CMP r0, r14
  JZ r0, loop_0
  FRAME
  JMP loop_0