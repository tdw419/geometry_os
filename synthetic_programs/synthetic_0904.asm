; Synthetic GeOS Program
; initialization
LDI r30, 774
LDI r1, 799
LDI r28, 108
LDI r10, 0x888888
LDI r16, 789
; arithmetic section
ADD r2, r15, r6
SUB r14, r28, r31
SUB r11, r10, r2
ADD r21, r16, r31
ADD r1, r7, r21
; main loop
loop_0:
  LDI r12, 8947848
  FILL r12
PSET r8, r20, r29
LINE r15, r29, r28, r16, r23
  FRAME
  JMP loop_0