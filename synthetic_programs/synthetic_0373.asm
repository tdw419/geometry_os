; Synthetic GeOS Program
; initialization
LDI r20, 903
LDI r5, 23
LDI r8, 782
LDI r12, 518
; arithmetic section
SUB r15, r16, r20
SUB r6, r26, r6
LDI r3, 895
SUB r27, r14, r7
LDI r11, 1006
; main loop
loop_0:
  LDI r6, 16711680
  FILL r6
LINE r0, r13, r10, r4, r16
RECTF r20, r22, r23, r24, r21
RECTF r21, r4, r9, r18, r13
  FRAME
  JMP loop_0