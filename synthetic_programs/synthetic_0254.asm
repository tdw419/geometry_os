; Synthetic GeOS Program
; initialization
LDI r28, 685
LDI r13, 659
LDI r25, 891
LDI r19, 530
; arithmetic section
SUB r28, r7, r19
LDI r25, 709
ADD r18, r18, r26
ADD r2, r6, r16
LDI r7, 799
ADD r24, r0, r16
SUB r13, r31, r27
; main loop
loop_0:
  LDI r19, 255
  FILL r19
RECTF r27, r31, r12, r17, r30
LINE r16, r5, r28, r20, r3
  FRAME
  JMP loop_0