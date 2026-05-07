; Synthetic GeOS Program
; initialization
LDI r15, 659
LDI r30, 986
LDI r9, 511
LDI r20, 297
; arithmetic section
ADD r27, r17, r2
ADD r31, r6, r24
LDI r20, 28
LDI r19, 0x888888
; main loop
loop_0:
  LDI r12, 16776960
  FILL r12
RECTF r30, r8, r17, r25, r16
PSET r4, r21, r7
  FRAME
  JMP loop_0