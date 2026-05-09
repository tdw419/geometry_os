; DESCRIPTION: Composite: Draws a orange line from (120, 85) to (142, 10) then Creates a red rectangular region at (62, 3) spanning 119 by 15 pixels.
; PLAN: r0=120(x1), r1=85(y1), r2=142(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=3(y), r7=119(width), r8=15(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 85
LDI r2, 142
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 3
LDI r7, 119
LDI r8, 15
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
