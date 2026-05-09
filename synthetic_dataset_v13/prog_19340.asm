; DESCRIPTION: Composite: Renders a black line between points (378, 164) and (137, 116) then Draws a purple rectangle at (123, 85) with width 29 and height 65.
; PLAN: r0=378(x1), r1=164(y1), r2=137(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=123(x), r6=85(y), r7=29(width), r8=65(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 164
LDI r2, 137
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 85
LDI r7, 29
LDI r8, 65
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
