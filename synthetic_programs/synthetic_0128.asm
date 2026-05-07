; Synthetic GeOS Program
; initialization
LDI r18, 290
LDI r12, 75
; arithmetic section
ADD r16, r8, r14
SUB r10, r13, r13
LDI r29, 69
SUB r12, r6, r6
; main loop
loop_0:
  LDI r10, 16777215
  FILL r10
PSET r29, r29, r30
PSET r14, r9, r22
  FRAME
  JMP loop_0