; Synthetic GeOS Program
; initialization
LDI r18, 587
LDI r13, 0x000000
LDI r17, 845
LDI r2, 493
; arithmetic section
SUB r19, r24, r22
ADD r11, r18, r29
LDI r16, 382
ADD r28, r22, r16
; main loop
loop_0:
  LDI r19, 16711935
  FILL r19
LINE r12, r30, r30, r2, r1
  CMP r16, r1
  JZ r0, loop_0
  FRAME
  JMP loop_0