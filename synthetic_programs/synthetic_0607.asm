; Synthetic GeOS Program
; initialization
LDI r31, 453
LDI r8, 828
LDI r14, 84
LDI r25, 774
LDI r2, 305
; arithmetic section
SUB r5, r9, r4
LDI r28, 557
LDI r17, 0x00FFFF
ADD r2, r27, r17
SUB r2, r12, r25
SUB r1, r13, r24
LDI r27, 632
; main loop
loop_0:
  LDI r4, 16711680
  FILL r4
CIRCLE r28, r5, r31, r22
  FRAME
  JMP loop_0