; Synthetic GeOS Program
; initialization
LDI r15, 809
LDI r0, 139
LDI r2, 1006
LDI r28, 0x0000FF
; arithmetic section
LDI r14, 789
ADD r20, r6, r5
LDI r3, 848
ADD r28, r27, r17
SUB r23, r29, r4
; main loop
loop_0:
  LDI r30, 65280
  FILL r30
PSET r10, r18, r15
LINE r5, r19, r5, r4, r28
  CMP r24, r18
  JZ r0, loop_0
  FRAME
  JMP loop_0