; Synthetic GeOS Program
; initialization
LDI r20, 849
LDI r14, 76
LDI r17, 600
LDI r4, 0xFF00FF
LDI r20, 495
LDI r28, 252
; arithmetic section
ADD r4, r27, r18
SUB r20, r19, r26
SUB r11, r11, r30
SUB r22, r12, r16
SUB r27, r10, r3
SUB r19, r30, r26
; main loop
loop_0:
  LDI r24, 16711935
  FILL r24
RECTF r7, r9, r15, r0, r2
  CMP r1, r28
  JZ r0, loop_0
  FRAME
  JMP loop_0