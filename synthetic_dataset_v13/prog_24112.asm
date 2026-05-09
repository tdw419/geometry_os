; DESCRIPTION: Composite: Places a blue line segment connecting (453, 84) to (261, 193) then Draws a green rectangle at (281, 126) with width 97 and height 83 then Places a green dot at position (383, 218).
; PLAN: r0=453(x1), r1=84(y1), r2=261(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=126(y), r7=97(width), r8=83(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x), r11=218(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 453
LDI r1, 84
LDI r2, 261
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 126
LDI r7, 97
LDI r8, 83
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 218
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
