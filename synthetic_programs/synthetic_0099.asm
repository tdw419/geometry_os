; Synthetic GeOS Program
; initialization
LDI r16, 555
LDI r26, 479
LDI r30, 187
LDI r15, 65
LDI r19, 0xFFFFFF
; arithmetic section
ADD r18, r19, r11
ADD r18, r14, r24
ADD r7, r6, r25
ADD r7, r30, r19
; main loop
loop_0:
  LDI r0, 16711935
  FILL r0
CIRCLE r13, r6, r7, r2
RECTF r6, r24, r1, r23, r16
  FRAME
  JMP loop_0