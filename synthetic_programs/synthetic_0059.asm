; Synthetic GeOS Program
; initialization
LDI r9, 86
LDI r19, 626
LDI r26, 321
LDI r28, 187
; arithmetic section
ADD r25, r13, r3
ADD r3, r7, r7
LDI r31, 735
SUB r25, r15, r16
ADD r23, r16, r23
; main loop
loop_0:
  LDI r23, 0
  FILL r23
CIRCLE r30, r31, r8, r10
RECTF r2, r14, r9, r26, r25
  CMP r3, r23
  JZ r0, loop_0
  FRAME
  JMP loop_0