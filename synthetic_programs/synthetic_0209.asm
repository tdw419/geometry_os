; Synthetic GeOS Program
; initialization
LDI r30, 0xFF00FF
LDI r9, 451
; arithmetic section
SUB r28, r29, r7
LDI r1, 395
ADD r23, r23, r21
ADD r16, r23, r27
SUB r15, r20, r22
ADD r2, r9, r31
ADD r16, r27, r29
SUB r5, r28, r27
; main loop
loop_0:
  LDI r12, 16776960
  FILL r12
CIRCLE r25, r21, r18, r24
LINE r11, r12, r21, r20, r17
  CMP r14, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0