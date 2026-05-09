; DESCRIPTION: Composite: Draws a green rectangle at (314, 73) with width 17 and height 92 then Renders a blue line between points (443, 201) and (232, 116) then Places a yellow dot at position (47, 110).
; PLAN: r0=314(x), r1=73(y), r2=17(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x1), r6=201(y1), r7=232(x2), r8=116(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=47(x), r11=110(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 314
LDI r1, 73
LDI r2, 17
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 201
LDI r7, 232
LDI r8, 116
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 110
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
