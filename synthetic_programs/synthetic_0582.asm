; Synthetic GeOS Program
; initialization
LDI r10, 989
LDI r22, 628
; arithmetic section
ADD r5, r6, r9
LDI r10, 966
ADD r7, r30, r20
LDI r22, 412
LDI r25, 282
LDI r17, 692
ADD r20, r21, r3
; main loop
loop_0:
  LDI r5, 16776960
  FILL r5
RECTF r18, r7, r13, r30, r4
RECTF r25, r16, r25, r5, r16
LINE r31, r21, r20, r17, r0
  FRAME
  JMP loop_0