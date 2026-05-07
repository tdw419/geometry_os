; Synthetic GeOS Program
; initialization
LDI r31, 352
LDI r20, 61
LDI r7, 957
LDI r27, 438
LDI r25, 553
LDI r14, 140
; arithmetic section
LDI r1, 748
SUB r26, r29, r5
LDI r22, 524
LDI r5, 896
SUB r1, r12, r1
; main loop
loop_0:
  LDI r3, 16776960
  FILL r3
LINE r18, r20, r25, r27, r6
  CMP r13, r13
  JZ r0, loop_0
  FRAME
  JMP loop_0