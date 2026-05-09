; DESCRIPTION: Composite: Places a yellow line segment connecting (484, 67) to (145, 30) then Draws a green rectangle at (283, 111) with width 119 and height 95 then Places a blue dot at position (107, 39).
; PLAN: r0=484(x1), r1=67(y1), r2=145(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=111(y), r7=119(width), r8=95(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x), r11=39(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 484
LDI r1, 67
LDI r2, 145
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 111
LDI r7, 119
LDI r8, 95
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 39
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
