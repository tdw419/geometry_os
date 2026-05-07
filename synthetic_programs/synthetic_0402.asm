; Synthetic GeOS Program
; initialization
LDI r5, 213
LDI r12, 183
LDI r13, 532
LDI r30, 761
; arithmetic section
ADD r16, r5, r20
ADD r30, r25, r24
SUB r17, r7, r0
ADD r24, r31, r17
; main loop
loop_0:
  LDI r1, 16776960
  FILL r1
RECTF r27, r31, r29, r20, r29
  FRAME
  JMP loop_0