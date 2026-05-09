; DESCRIPTION: Composite: Draws a white rectangle at (13, 107) with width 105 and height 118 then Renders a orange line between points (149, 153) and (359, 190).
; PLAN: r0=13(x), r1=107(y), r2=105(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x1), r6=153(y1), r7=359(x2), r8=190(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 13
LDI r1, 107
LDI r2, 105
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 153
LDI r7, 359
LDI r8, 190
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
