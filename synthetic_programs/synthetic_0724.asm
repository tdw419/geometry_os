; Synthetic GeOS Program
; initialization
LDI r29, 480
LDI r27, 514
LDI r9, 368
LDI r1, 550
LDI r9, 144
LDI r21, 966
; arithmetic section
SUB r17, r4, r18
SUB r18, r1, r16
SUB r13, r19, r26
LDI r24, 460
SUB r24, r21, r16
SUB r20, r22, r14
LDI r11, 887
LDI r12, 963
; main loop
loop_0:
  LDI r2, 16776960
  FILL r2
CIRCLE r22, r26, r18, r1
  FRAME
  JMP loop_0