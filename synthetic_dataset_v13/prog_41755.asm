; DESCRIPTION: Composite: Renders a orange line between points (0, 57) and (136, 217) then Draws a purple rectangle at (318, 40) with width 35 and height 97 then Places a purple dot at position (472, 108).
; PLAN: r0=0(x1), r1=57(y1), r2=136(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=40(y), r7=35(width), r8=97(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=472(x), r11=108(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 0
LDI r1, 57
LDI r2, 136
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 40
LDI r7, 35
LDI r8, 97
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 108
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
