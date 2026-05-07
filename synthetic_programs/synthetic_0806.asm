; Synthetic GeOS Program
; initialization
LDI r5, 248
LDI r24, 0x888888
; arithmetic section
SUB r2, r9, r3
LDI r10, 770
LDI r29, 586
ADD r6, r19, r17
ADD r17, r0, r17
LDI r7, 0x00FF00
ADD r18, r24, r7
LDI r1, 0x000000
; main loop
loop_0:
  LDI r23, 16776960
  FILL r23
LINE r1, r20, r13, r23, r27
  CMP r25, r30
  JZ r0, loop_0
  FRAME
  JMP loop_0