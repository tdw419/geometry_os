; Synthetic GeOS Program
; initialization
LDI r30, 319
LDI r24, 953
LDI r23, 316
; arithmetic section
LDI r24, 842
LDI r29, 303
ADD r14, r27, r0
; main loop
loop_0:
  LDI r25, 16777215
  FILL r25
RECTF r1, r21, r30, r6, r8
RECTF r2, r17, r6, r8, r13
PSET r4, r14, r4
  CMP r22, r0
  JZ r0, loop_0
  FRAME
  JMP loop_0