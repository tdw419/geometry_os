; Synthetic GeOS Program
; initialization
LDI r13, 55
LDI r7, 0xFFFF00
; arithmetic section
LDI r19, 973
ADD r13, r13, r23
SUB r30, r4, r12
LDI r20, 974
LDI r10, 0x0000FF
ADD r23, r12, r22
LDI r9, 197
ADD r16, r14, r20
; main loop
loop_0:
  LDI r15, 65280
  FILL r15
CIRCLE r24, r13, r15, r28
PSET r11, r21, r23
  FRAME
  JMP loop_0