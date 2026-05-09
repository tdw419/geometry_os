; DESCRIPTION: Composite: Renders a red line between points (106, 241) and (34, 133) then Draws a orange rectangle at (63, 56) with width 38 and height 107 then Places a purple dot at position (155, 55).
; PLAN: r0=106(x1), r1=241(y1), r2=34(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=56(y), r7=38(width), r8=107(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=155(x), r11=55(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 106
LDI r1, 241
LDI r2, 34
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 56
LDI r7, 38
LDI r8, 107
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 55
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
