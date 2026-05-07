; Synthetic GeOS Program
; initialization
LDI r31, 785
LDI r0, 534
LDI r16, 363
LDI r22, 0x0000FF
LDI r20, 429
; arithmetic section
ADD r23, r11, r20
ADD r27, r22, r2
LDI r26, 218
ADD r0, r19, r2
LDI r23, 818
LDI r31, 917
; main loop
loop_0:
  LDI r23, 0
  FILL r23
RECTF r18, r2, r17, r27, r22
CIRCLE r27, r11, r22, r20
PSET r17, r1, r14
  FRAME
  JMP loop_0