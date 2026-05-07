; Synthetic GeOS Program
; initialization
LDI r25, 419
LDI r16, 721
LDI r26, 0xFFFFFF
LDI r13, 311
LDI r31, 314
LDI r0, 21
; arithmetic section
SUB r3, r23, r22
SUB r19, r19, r5
LDI r13, 183
ADD r24, r15, r17
ADD r29, r13, r14
LDI r30, 442
LDI r30, 50
ADD r24, r24, r17
; main loop
loop_0:
  LDI r23, 16711935
  FILL r23
CIRCLE r21, r27, r27, r30
PSET r9, r20, r26
  FRAME
  JMP loop_0