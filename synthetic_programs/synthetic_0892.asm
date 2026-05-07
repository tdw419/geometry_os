; Synthetic GeOS Program
; initialization
LDI r6, 904
LDI r13, 649
LDI r12, 1001
LDI r3, 841
; arithmetic section
LDI r1, 265
LDI r12, 356
SUB r22, r4, r25
LDI r11, 5
LDI r29, 0x0000FF
ADD r7, r5, r28
ADD r19, r31, r31
SUB r9, r26, r1
; main loop
loop_0:
  LDI r10, 65280
  FILL r10
CIRCLE r10, r7, r17, r29
PSET r28, r5, r8
LINE r26, r18, r22, r2, r19
  CMP r18, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0