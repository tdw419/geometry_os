; Synthetic GeOS Program
; initialization
LDI r24, 492
LDI r14, 540
LDI r0, 171
LDI r31, 799
; arithmetic section
ADD r18, r21, r13
ADD r25, r8, r10
ADD r4, r14, r30
; main loop
loop_0:
  LDI r28, 16711935
  FILL r28
LINE r0, r17, r14, r12, r27
CIRCLE r31, r27, r20, r22
  CMP r9, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0