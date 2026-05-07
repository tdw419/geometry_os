; Synthetic GeOS Program
; initialization
LDI r16, 0xFF00FF
LDI r15, 447
LDI r28, 0x00FF00
; arithmetic section
LDI r23, 281
LDI r25, 77
LDI r23, 867
SUB r12, r30, r21
ADD r10, r29, r24
SUB r9, r3, r4
ADD r22, r3, r24
SUB r30, r24, r9
; main loop
loop_0:
  LDI r28, 0
  FILL r28
CIRCLE r13, r8, r18, r15
LINE r12, r11, r9, r17, r8
  FRAME
  JMP loop_0