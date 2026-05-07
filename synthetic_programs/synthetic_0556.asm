; Synthetic GeOS Program
; initialization
LDI r20, 455
LDI r12, 926
LDI r8, 1003
LDI r21, 541
LDI r28, 801
; arithmetic section
LDI r15, 0x00FF00
SUB r26, r10, r21
SUB r4, r12, r3
; main loop
loop_0:
  LDI r20, 16711680
  FILL r20
RECTF r28, r1, r6, r16, r23
  FRAME
  JMP loop_0