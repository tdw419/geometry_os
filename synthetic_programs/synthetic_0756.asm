; Synthetic GeOS Program
; initialization
LDI r13, 631
LDI r20, 0xFF00FF
LDI r29, 366
LDI r24, 49
; arithmetic section
LDI r31, 216
SUB r24, r13, r6
LDI r27, 320
; main loop
loop_0:
  LDI r26, 16776960
  FILL r26
RECTF r0, r29, r23, r2, r16
LINE r0, r11, r28, r16, r4
PSET r18, r24, r10
  FRAME
  JMP loop_0