; Synthetic GeOS Program
; initialization
LDI r21, 224
LDI r19, 0x0000FF
; arithmetic section
ADD r5, r17, r4
SUB r20, r4, r21
LDI r3, 380
; main loop
loop_0:
  LDI r15, 16776960
  FILL r15
RECTF r31, r26, r17, r14, r29
RECTF r23, r25, r7, r4, r31
  CMP r29, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0