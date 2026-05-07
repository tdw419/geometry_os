; Synthetic GeOS Program
; initialization
LDI r3, 741
LDI r4, 0xFF0000
; arithmetic section
LDI r28, 867
LDI r8, 806
LDI r1, 207
LDI r10, 770
ADD r16, r22, r2
ADD r31, r12, r29
; main loop
loop_0:
  LDI r16, 0
  FILL r16
LINE r28, r16, r29, r8, r24
CIRCLE r21, r5, r30, r29
CIRCLE r12, r21, r25, r11
  CMP r25, r0
  JZ r0, loop_0
  FRAME
  JMP loop_0