; Synthetic GeOS Program
; initialization
LDI r18, 296
LDI r18, 142
LDI r12, 746
LDI r23, 734
LDI r20, 964
; arithmetic section
ADD r4, r26, r23
LDI r23, 328
LDI r10, 840
; main loop
loop_0:
  LDI r30, 16777215
  FILL r30
RECTF r24, r29, r31, r15, r31
PSET r20, r16, r10
  CMP r30, r16
  JZ r0, loop_0
  FRAME
  JMP loop_0