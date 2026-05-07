; Synthetic GeOS Program
; initialization
LDI r29, 357
LDI r21, 826
LDI r1, 0x00FFFF
LDI r3, 679
LDI r16, 230
LDI r22, 0x0000FF
; arithmetic section
ADD r27, r15, r29
ADD r1, r2, r25
LDI r6, 118
ADD r31, r9, r12
ADD r28, r14, r27
LDI r31, 1011
ADD r9, r5, r12
ADD r17, r10, r11
; main loop
loop_0:
  LDI r3, 65280
  FILL r3
LINE r2, r26, r20, r24, r22
CIRCLE r2, r12, r10, r5
RECTF r28, r26, r22, r25, r14
  FRAME
  JMP loop_0