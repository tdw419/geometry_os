; Synthetic GeOS Program
; initialization
LDI r31, 475
LDI r3, 777
LDI r21, 0x0000FF
; arithmetic section
LDI r6, 101
ADD r4, r27, r19
ADD r8, r30, r28
ADD r18, r16, r27
ADD r6, r22, r10
LDI r28, 224
LDI r21, 0x00FF00
LDI r12, 0x000000
; main loop
loop_0:
  LDI r12, 0
  FILL r12
PSET r18, r1, r18
RECTF r18, r5, r2, r28, r26
  FRAME
  JMP loop_0