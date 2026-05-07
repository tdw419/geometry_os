; Synthetic GeOS Program
; initialization
LDI r19, 153
LDI r17, 628
LDI r5, 1012
LDI r0, 288
LDI r3, 957
; arithmetic section
SUB r5, r22, r10
SUB r25, r21, r9
LDI r27, 593
ADD r30, r19, r9
ADD r3, r30, r22
ADD r29, r29, r1
; main loop
loop_0:
  LDI r6, 16776960
  FILL r6
RECTF r31, r14, r7, r9, r30
RECTF r28, r0, r9, r25, r11
PSET r30, r25, r22
  FRAME
  JMP loop_0