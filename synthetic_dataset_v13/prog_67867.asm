; DESCRIPTION: Composite: Renders a orange line between points (131, 110) and (19, 167) then Creates a red rectangular region at (414, 45) spanning 71 by 106 pixels.
; PLAN: r0=131(x1), r1=110(y1), r2=19(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=45(y), r7=71(width), r8=106(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 110
LDI r2, 19
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 45
LDI r7, 71
LDI r8, 106
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
