; Synthetic GeOS Program
; initialization
LDI r23, 398
LDI r15, 0x888888
; arithmetic section
ADD r3, r10, r22
SUB r9, r22, r23
SUB r26, r4, r5
SUB r30, r0, r25
ADD r21, r6, r1
SUB r29, r29, r28
LDI r12, 855
LDI r3, 447
; main loop
loop_0:
  LDI r6, 65280
  FILL r6
CIRCLE r28, r1, r29, r25
  FRAME
  JMP loop_0