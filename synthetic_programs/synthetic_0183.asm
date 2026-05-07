; Synthetic GeOS Program
; initialization
LDI r25, 560
LDI r8, 446
; arithmetic section
ADD r24, r30, r21
SUB r9, r6, r26
ADD r4, r1, r11
SUB r26, r29, r0
ADD r17, r4, r11
LDI r21, 220
; main loop
loop_0:
  LDI r8, 16711935
  FILL r8
CIRCLE r6, r12, r14, r14
LINE r9, r18, r23, r1, r19
  FRAME
  JMP loop_0