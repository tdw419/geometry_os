; Synthetic GeOS Program
; initialization
LDI r12, 0xFFFFFF
LDI r17, 102
; arithmetic section
SUB r29, r0, r21
LDI r30, 369
SUB r0, r17, r9
SUB r5, r2, r20
ADD r0, r8, r4
; main loop
loop_0:
  LDI r20, 0
  FILL r20
PSET r28, r13, r4
  FRAME
  JMP loop_0