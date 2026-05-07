; Synthetic GeOS Program
; initialization
LDI r6, 434
LDI r17, 0xFF00FF
LDI r28, 219
LDI r29, 891
LDI r2, 505
; arithmetic section
LDI r3, 679
SUB r17, r26, r23
ADD r15, r29, r19
LDI r6, 27
LDI r9, 0xFFFF00
; main loop
loop_0:
  LDI r5, 16776960
  FILL r5
LINE r10, r11, r3, r17, r3
  CMP r1, r23
  JZ r0, loop_0
  FRAME
  JMP loop_0