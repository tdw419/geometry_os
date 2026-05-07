; Synthetic GeOS Program
; initialization
LDI r5, 32
LDI r8, 715
LDI r4, 668
LDI r27, 195
LDI r25, 0xFFFFFF
; arithmetic section
SUB r6, r14, r1
SUB r29, r30, r8
SUB r27, r29, r25
ADD r3, r23, r24
ADD r21, r2, r1
ADD r20, r25, r7
ADD r23, r14, r15
; main loop
loop_0:
  LDI r2, 65535
  FILL r2
LINE r16, r24, r2, r28, r19
LINE r22, r17, r5, r10, r24
RECTF r12, r14, r24, r26, r19
  FRAME
  JMP loop_0