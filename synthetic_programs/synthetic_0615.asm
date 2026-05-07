; Synthetic GeOS Program
; initialization
LDI r15, 0x0000FF
LDI r14, 0xFF0000
LDI r28, 743
LDI r19, 0xFF00FF
LDI r28, 357
LDI r18, 0xFF00FF
; arithmetic section
ADD r20, r9, r6
LDI r3, 988
SUB r27, r12, r1
LDI r0, 867
ADD r20, r14, r2
SUB r6, r28, r16
ADD r17, r23, r22
; main loop
loop_0:
  LDI r17, 0
  FILL r17
PSET r10, r2, r20
RECTF r22, r24, r11, r8, r20
  FRAME
  JMP loop_0