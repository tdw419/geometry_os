; Synthetic GeOS Program
; initialization
LDI r0, 917
LDI r27, 749
LDI r13, 349
; arithmetic section
SUB r28, r21, r23
ADD r12, r7, r9
LDI r22, 864
ADD r26, r16, r4
ADD r30, r19, r25
LDI r12, 921
; main loop
loop_0:
  LDI r29, 8947848
  FILL r29
LINE r14, r1, r21, r10, r20
  CMP r3, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0