; Synthetic GeOS Program
; initialization
LDI r11, 672
LDI r17, 286
LDI r9, 0x0000FF
LDI r26, 30
LDI r4, 555
; arithmetic section
LDI r11, 306
ADD r16, r27, r11
LDI r0, 517
ADD r5, r6, r8
ADD r7, r9, r17
; main loop
loop_0:
  LDI r5, 65535
  FILL r5
RECTF r17, r8, r2, r2, r25
CIRCLE r15, r23, r21, r30
  CMP r9, r2
  JZ r0, loop_0
  FRAME
  JMP loop_0