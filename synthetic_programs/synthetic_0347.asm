; Synthetic GeOS Program
; initialization
LDI r30, 300
LDI r3, 84
LDI r3, 581
LDI r13, 485
LDI r6, 853
; arithmetic section
LDI r23, 137
LDI r12, 107
LDI r25, 773
LDI r10, 0x000000
ADD r27, r21, r11
ADD r5, r21, r12
; main loop
loop_0:
  LDI r25, 16777215
  FILL r25
PSET r6, r19, r29
RECTF r10, r17, r31, r16, r2
CIRCLE r24, r30, r9, r5
  FRAME
  JMP loop_0