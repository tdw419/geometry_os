; Synthetic GeOS Program
; initialization
LDI r17, 52
LDI r20, 602
LDI r5, 875
LDI r20, 0xFF0000
; arithmetic section
SUB r25, r9, r12
LDI r30, 767
SUB r15, r22, r12
LDI r21, 639
ADD r22, r17, r25
; main loop
loop_0:
  LDI r27, 16776960
  FILL r27
CIRCLE r28, r5, r31, r19
  FRAME
  JMP loop_0