; Synthetic GeOS Program
; initialization
LDI r25, 731
LDI r2, 874
LDI r21, 35
LDI r23, 3
LDI r20, 373
LDI r30, 521
; arithmetic section
ADD r2, r25, r5
SUB r1, r25, r18
ADD r27, r18, r0
ADD r7, r24, r15
; main loop
loop_0:
  LDI r13, 0
  FILL r13
PSET r16, r26, r28
  FRAME
  JMP loop_0