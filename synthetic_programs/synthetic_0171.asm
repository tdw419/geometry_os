; Synthetic GeOS Program
; initialization
LDI r6, 553
LDI r12, 407
; arithmetic section
SUB r26, r21, r3
LDI r4, 959
ADD r6, r13, r22
LDI r30, 579
SUB r24, r16, r21
ADD r3, r2, r3
SUB r26, r27, r8
; main loop
loop_0:
  LDI r1, 16711680
  FILL r1
PSET r18, r10, r15
RECTF r2, r27, r6, r20, r2
CIRCLE r25, r8, r20, r5
  CMP r28, r15
  JZ r0, loop_0
  FRAME
  JMP loop_0