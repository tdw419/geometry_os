; Synthetic GeOS Program
; initialization
LDI r21, 60
LDI r19, 592
LDI r22, 811
LDI r19, 0xFF0000
LDI r13, 730
; main loop
loop_0:
  LDI r0, 16711935
  FILL r0
LINE r31, r3, r20, r6, r8
LINE r13, r10, r16, r30, r4
RECTF r24, r28, r0, r16, r3
  FRAME
  JMP loop_0