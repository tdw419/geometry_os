; Synthetic GeOS Program
; initialization
LDI r13, 399
LDI r9, 115
LDI r20, 324
LDI r3, 26
LDI r6, 0xFF00FF
LDI r18, 636
; arithmetic section
SUB r18, r9, r6
ADD r25, r22, r7
SUB r27, r17, r10
SUB r10, r5, r20
ADD r8, r9, r7
LDI r27, 0x000000
SUB r1, r5, r28
LDI r29, 825
; main loop
loop_0:
  LDI r30, 16776960
  FILL r30
PSET r6, r20, r27
  FRAME
  JMP loop_0