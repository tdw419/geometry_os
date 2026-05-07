; Synthetic GeOS Program
; initialization
LDI r7, 586
LDI r11, 118
LDI r3, 18
LDI r29, 435
LDI r21, 405
; arithmetic section
ADD r13, r10, r2
SUB r3, r9, r27
LDI r9, 577
SUB r28, r26, r24
LDI r23, 164
LDI r11, 240
ADD r30, r1, r0
ADD r15, r27, r22
; main loop
loop_0:
  LDI r20, 65280
  FILL r20
LINE r16, r19, r14, r13, r25
  FRAME
  JMP loop_0