; Synthetic GeOS Program
; initialization
LDI r7, 813
LDI r24, 145
; arithmetic section
ADD r29, r26, r9
LDI r23, 17
ADD r19, r10, r16
LDI r21, 0x888888
LDI r31, 0x0000FF
LDI r3, 283
; main loop
loop_0:
  LDI r8, 16776960
  FILL r8
PSET r22, r19, r1
CIRCLE r5, r31, r14, r23
LINE r9, r12, r15, r6, r7
  CMP r0, r16
  JZ r0, loop_0
  FRAME
  JMP loop_0