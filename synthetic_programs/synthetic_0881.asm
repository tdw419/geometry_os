; Synthetic GeOS Program
; initialization
LDI r31, 472
LDI r14, 430
; arithmetic section
ADD r24, r31, r5
LDI r12, 767
LDI r8, 50
; main loop
loop_0:
  LDI r12, 16776960
  FILL r12
PSET r27, r0, r10
PSET r29, r27, r5
RECTF r3, r14, r8, r17, r29
  FRAME
  JMP loop_0