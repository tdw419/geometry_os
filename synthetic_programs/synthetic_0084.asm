; Synthetic GeOS Program
; initialization
LDI r24, 533
LDI r25, 707
LDI r24, 104
LDI r3, 239
; arithmetic section
SUB r28, r7, r28
LDI r7, 466
ADD r18, r29, r22
; main loop
loop_0:
  LDI r18, 8947848
  FILL r18
LINE r0, r11, r1, r8, r24
  CMP r23, r29
  JZ r0, loop_0
  FRAME
  JMP loop_0