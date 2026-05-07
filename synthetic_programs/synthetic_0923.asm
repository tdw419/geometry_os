; Synthetic GeOS Program
; initialization
LDI r7, 803
LDI r6, 0x00FF00
; arithmetic section
ADD r28, r4, r29
SUB r17, r14, r26
LDI r21, 187
SUB r25, r12, r3
LDI r11, 866
; main loop
loop_0:
  LDI r16, 16776960
  FILL r16
RECTF r19, r18, r14, r12, r6
  FRAME
  JMP loop_0