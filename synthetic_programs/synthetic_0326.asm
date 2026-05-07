; Synthetic GeOS Program
; initialization
LDI r1, 339
LDI r28, 0xFF00FF
LDI r15, 163
LDI r20, 0xFF00FF
LDI r7, 414
LDI r14, 599
; main loop
loop_0:
  LDI r5, 255
  FILL r5
LINE r14, r29, r0, r0, r15
LINE r28, r6, r21, r14, r21
LINE r28, r8, r3, r21, r7
  FRAME
  JMP loop_0