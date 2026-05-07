; Synthetic GeOS Program
; initialization
LDI r15, 260
LDI r22, 13
LDI r24, 724
LDI r28, 272
; arithmetic section
ADD r21, r12, r13
SUB r28, r9, r25
LDI r6, 488
; main loop
loop_0:
  LDI r21, 65280
  FILL r21
CIRCLE r14, r1, r15, r17
  CMP r3, r18
  JZ r0, loop_0
  FRAME
  JMP loop_0