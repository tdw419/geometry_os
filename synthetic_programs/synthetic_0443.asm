; Synthetic GeOS Program
; initialization
LDI r0, 0xFF00FF
LDI r3, 12
LDI r29, 237
LDI r10, 415
LDI r16, 459
LDI r30, 272
; arithmetic section
ADD r23, r24, r20
ADD r27, r10, r10
ADD r4, r23, r10
SUB r7, r27, r21
LDI r5, 970
; main loop
loop_0:
  LDI r28, 8947848
  FILL r28
LINE r16, r3, r5, r8, r18
RECTF r16, r9, r15, r22, r6
RECTF r5, r1, r22, r30, r10
  CMP r29, r22
  JZ r0, loop_0
  FRAME
  JMP loop_0