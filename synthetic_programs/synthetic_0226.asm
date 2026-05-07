; Synthetic GeOS Program
; initialization
LDI r14, 477
LDI r6, 1004
LDI r8, 0x000000
LDI r5, 488
LDI r13, 438
; arithmetic section
SUB r29, r3, r28
ADD r13, r22, r27
SUB r27, r7, r14
SUB r0, r31, r3
SUB r21, r26, r26
LDI r28, 886
; main loop
loop_0:
  LDI r31, 0
  FILL r31
RECTF r23, r4, r12, r0, r16
PSET r30, r5, r26
RECTF r12, r1, r25, r23, r20
  CMP r30, r21
  JZ r0, loop_0
  FRAME
  JMP loop_0