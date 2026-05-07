; Synthetic GeOS Program
; initialization
LDI r14, 678
LDI r10, 673
; arithmetic section
LDI r16, 0xFFFFFF
SUB r2, r2, r11
ADD r23, r7, r12
SUB r23, r12, r26
ADD r13, r7, r29
; main loop
loop_0:
  LDI r14, 0
  FILL r14
PSET r14, r26, r22
PSET r16, r22, r26
  FRAME
  JMP loop_0