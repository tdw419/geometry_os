; Synthetic GeOS Program
; initialization
LDI r6, 950
LDI r22, 477
LDI r1, 448
; arithmetic section
SUB r29, r28, r20
SUB r25, r10, r26
SUB r30, r5, r15
; main loop
loop_0:
  LDI r25, 0
  FILL r25
RECTF r16, r14, r27, r20, r1
  CMP r17, r22
  JZ r0, loop_0
  FRAME
  JMP loop_0