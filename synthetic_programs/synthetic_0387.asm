; Synthetic GeOS Program
; initialization
LDI r5, 945
LDI r3, 0xFFFF00
LDI r27, 691
LDI r31, 957
; arithmetic section
SUB r4, r15, r13
SUB r10, r28, r16
SUB r26, r20, r1
SUB r22, r19, r13
LDI r31, 794
SUB r14, r1, r18
ADD r12, r3, r0
; main loop
loop_0:
  LDI r30, 16776960
  FILL r30
LINE r21, r13, r11, r30, r9
RECTF r26, r19, r0, r24, r29
CIRCLE r0, r1, r16, r26
  FRAME
  JMP loop_0