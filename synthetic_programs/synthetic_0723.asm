; Synthetic GeOS Program
; initialization
LDI r29, 0x00FF00
LDI r13, 503
; arithmetic section
ADD r17, r10, r29
LDI r3, 0xFF0000
LDI r19, 313
SUB r24, r10, r7
SUB r0, r31, r14
SUB r1, r28, r25
SUB r19, r23, r25
; main loop
loop_0:
  LDI r14, 65280
  FILL r14
PSET r25, r25, r5
RECTF r7, r4, r22, r8, r10
  CMP r30, r20
  JZ r0, loop_0
  FRAME
  JMP loop_0