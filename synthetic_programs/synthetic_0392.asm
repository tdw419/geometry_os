; Synthetic GeOS Program
; initialization
LDI r3, 75
LDI r1, 113
LDI r3, 270
LDI r7, 282
LDI r3, 538
LDI r0, 204
; arithmetic section
LDI r24, 502
LDI r22, 657
LDI r10, 0x00FF00
SUB r21, r22, r11
SUB r2, r10, r21
ADD r30, r27, r8
SUB r23, r11, r11
; main loop
loop_0:
  LDI r6, 65280
  FILL r6
CIRCLE r25, r28, r10, r18
RECTF r1, r10, r20, r5, r13
LINE r24, r25, r10, r2, r29
  CMP r15, r3
  JZ r0, loop_0
  FRAME
  JMP loop_0