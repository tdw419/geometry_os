; Synthetic GeOS Program
; initialization
LDI r16, 148
LDI r5, 157
LDI r17, 866
LDI r19, 931
LDI r27, 538
LDI r1, 497
; arithmetic section
ADD r30, r23, r18
LDI r18, 0x000000
ADD r8, r3, r11
SUB r27, r5, r23
LDI r25, 0xFF00FF
ADD r16, r15, r2
SUB r14, r12, r24
; main loop
loop_0:
  LDI r6, 16776960
  FILL r6
RECTF r14, r3, r8, r25, r30
  CMP r12, r16
  JZ r0, loop_0
  FRAME
  JMP loop_0