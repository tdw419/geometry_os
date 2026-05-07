; Synthetic GeOS Program
; initialization
LDI r13, 1011
LDI r6, 479
LDI r8, 687
; arithmetic section
SUB r0, r20, r0
ADD r25, r26, r0
ADD r12, r2, r0
; main loop
loop_0:
  LDI r8, 65280
  FILL r8
LINE r20, r10, r21, r12, r18
  FRAME
  JMP loop_0