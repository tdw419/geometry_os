; Synthetic GeOS Program
; initialization
LDI r7, 0xFFFFFF
LDI r14, 479
; arithmetic section
SUB r3, r22, r7
ADD r8, r6, r5
SUB r13, r21, r7
LDI r7, 827
LDI r21, 181
LDI r19, 319
; main loop
loop_0:
  LDI r22, 16711935
  FILL r22
CIRCLE r13, r10, r7, r22
  CMP r5, r28
  JZ r0, loop_0
  FRAME
  JMP loop_0