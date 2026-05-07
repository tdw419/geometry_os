; Synthetic GeOS Program
; initialization
LDI r19, 610
LDI r11, 1
; arithmetic section
SUB r22, r18, r24
ADD r8, r20, r12
ADD r26, r1, r5
LDI r0, 301
ADD r23, r31, r17
; main loop
loop_0:
  LDI r23, 16711680
  FILL r23
RECTF r16, r21, r23, r4, r26
CIRCLE r28, r27, r23, r9
  CMP r18, r24
  JZ r0, loop_0
  FRAME
  JMP loop_0