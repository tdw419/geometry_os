; Synthetic GeOS Program
; initialization
LDI r21, 907
LDI r25, 823
LDI r23, 866
LDI r14, 71
LDI r14, 982
; arithmetic section
ADD r12, r9, r10
SUB r27, r12, r27
LDI r7, 1017
; main loop
loop_0:
  LDI r16, 16711680
  FILL r16
RECTF r4, r11, r24, r5, r16
LINE r12, r3, r30, r4, r16
RECTF r17, r1, r16, r15, r19
  FRAME
  JMP loop_0