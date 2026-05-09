; DESCRIPTION: Composite: Renders a orange line between points (8, 57) and (389, 6) then Creates a red rectangular region at (364, 57) spanning 34 by 117 pixels.
; PLAN: r0=8(x1), r1=57(y1), r2=389(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=57(y), r7=34(width), r8=117(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 8
LDI r1, 57
LDI r2, 389
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 57
LDI r7, 34
LDI r8, 117
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
