; Synthetic GeOS Program
; initialization
LDI r1, 208
LDI r2, 780
LDI r0, 317
LDI r15, 114
; arithmetic section
ADD r21, r19, r0
LDI r23, 0x00FF00
SUB r4, r20, r14
; main loop
loop_0:
  LDI r8, 16777215
  FILL r8
PSET r20, r21, r23
CIRCLE r14, r24, r1, r15
  FRAME
  JMP loop_0