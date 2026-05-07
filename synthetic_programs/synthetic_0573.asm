; Synthetic GeOS Program
; initialization
LDI r12, 574
LDI r2, 0x000000
; arithmetic section
SUB r16, r23, r17
LDI r9, 418
SUB r17, r14, r4
ADD r31, r26, r25
ADD r29, r0, r8
LDI r14, 413
SUB r27, r14, r6
ADD r12, r3, r5
; main loop
loop_0:
  LDI r24, 16711680
  FILL r24
CIRCLE r6, r13, r20, r8
CIRCLE r17, r15, r19, r21
RECTF r20, r5, r1, r7, r19
  CMP r21, r0
  JZ r0, loop_0
  FRAME
  JMP loop_0