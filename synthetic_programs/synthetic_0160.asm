; Synthetic GeOS Program
; initialization
LDI r9, 676
LDI r15, 0xFFFFFF
LDI r29, 0x00FF00
; arithmetic section
SUB r11, r5, r29
SUB r23, r26, r27
ADD r14, r26, r14
LDI r22, 302
LDI r13, 443
ADD r23, r27, r19
LDI r21, 742
ADD r12, r15, r15
; main loop
loop_0:
  LDI r7, 16711935
  FILL r7
CIRCLE r18, r30, r28, r1
PSET r5, r5, r21
  FRAME
  JMP loop_0