; DESCRIPTION: Composite: Draws a orange circle centered at (172, 133) with radius 50 then Renders a white line between points (106, 158) and (7, 174).
; PLAN: r0=172(x), r1=133(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x1), r6=158(y1), r7=7(x2), r8=174(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 133
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 158
LDI r7, 7
LDI r8, 174
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
