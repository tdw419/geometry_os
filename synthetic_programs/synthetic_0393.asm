; Synthetic GeOS Program
; initialization
LDI r24, 503
LDI r31, 0xFFFFFF
LDI r2, 617
; arithmetic section
SUB r29, r24, r0
ADD r23, r20, r31
ADD r9, r7, r2
ADD r1, r20, r10
SUB r14, r10, r23
SUB r23, r25, r13
; main loop
loop_0:
  LDI r23, 16777215
  FILL r23
PSET r10, r20, r15
PSET r14, r6, r6
  FRAME
  JMP loop_0