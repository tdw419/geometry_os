; Synthetic GeOS Program
; initialization
LDI r17, 728
LDI r11, 149
; arithmetic section
ADD r10, r20, r27
SUB r28, r20, r1
ADD r26, r0, r17
SUB r7, r4, r4
LDI r10, 396
LDI r23, 739
SUB r9, r29, r12
LDI r24, 271
; main loop
loop_0:
  LDI r29, 65280
  FILL r29
PSET r29, r10, r9
LINE r21, r31, r24, r20, r25
PSET r1, r17, r1
  CMP r12, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0