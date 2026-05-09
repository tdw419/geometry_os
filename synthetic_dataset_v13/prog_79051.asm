; DESCRIPTION: Composite: Renders a purple line between points (508, 90) and (210, 101) then Draws a orange rectangle at (211, 240) with width 85 and height 15.
; PLAN: r0=508(x1), r1=90(y1), r2=210(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=240(y), r7=85(width), r8=15(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 508
LDI r1, 90
LDI r2, 210
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 240
LDI r7, 85
LDI r8, 15
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
