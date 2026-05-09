; DESCRIPTION: Composite: Draws a orange circle centered at (218, 136) with radius 64 then Renders a red line between points (139, 172) and (153, 62).
; PLAN: r0=218(x), r1=136(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x1), r6=172(y1), r7=153(x2), r8=62(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 136
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 172
LDI r7, 153
LDI r8, 62
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
