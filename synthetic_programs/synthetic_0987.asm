; Synthetic GeOS Program
; initialization
LDI r2, 0x000000
LDI r9, 688
LDI r28, 801
LDI r14, 450
LDI r25, 0xFF0000
LDI r12, 417
; arithmetic section
ADD r0, r2, r7
ADD r16, r11, r24
LDI r30, 531
SUB r0, r19, r3
ADD r2, r0, r5
SUB r31, r24, r29
; main loop
loop_0:
  LDI r17, 16776960
  FILL r17
CIRCLE r24, r21, r12, r15
CIRCLE r22, r21, r9, r17
RECTF r10, r22, r4, r8, r6
  FRAME
  JMP loop_0