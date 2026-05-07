; Synthetic GeOS Program
; initialization
LDI r15, 862
LDI r16, 695
LDI r30, 465
LDI r3, 656
LDI r6, 454
; arithmetic section
ADD r5, r27, r22
LDI r22, 217
ADD r11, r4, r19
SUB r26, r0, r20
; main loop
loop_0:
  LDI r16, 8947848
  FILL r16
LINE r20, r27, r14, r22, r10
RECTF r20, r21, r4, r7, r1
RECTF r2, r19, r12, r13, r4
  CMP r10, r24
  JZ r0, loop_0
  FRAME
  JMP loop_0