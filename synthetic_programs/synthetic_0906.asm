; Synthetic GeOS Program
; initialization
LDI r30, 872
LDI r17, 20
LDI r21, 343
LDI r21, 0x00FFFF
LDI r17, 0xFFFFFF
LDI r1, 770
; arithmetic section
ADD r11, r14, r1
ADD r31, r7, r22
LDI r23, 303
ADD r26, r26, r2
ADD r25, r29, r20
ADD r20, r24, r3
; main loop
loop_0:
  LDI r12, 16776960
  FILL r12
CIRCLE r14, r28, r30, r7
  FRAME
  JMP loop_0