; Synthetic GeOS Program
; initialization
LDI r4, 482
LDI r1, 0x888888
; arithmetic section
SUB r17, r29, r18
ADD r28, r1, r23
LDI r30, 0xFFFF00
LDI r19, 0x000000
SUB r29, r1, r1
LDI r30, 974
SUB r6, r31, r28
SUB r3, r19, r25
; main loop
loop_0:
  LDI r24, 16776960
  FILL r24
CIRCLE r21, r24, r13, r15
CIRCLE r20, r28, r7, r2
LINE r24, r13, r22, r6, r11
  FRAME
  JMP loop_0