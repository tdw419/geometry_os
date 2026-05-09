; DESCRIPTION: Composite: Draws a orange circle centered at (159, 140) with radius 55 then Draws a red line from (58, 142) to (304, 232).
; PLAN: r0=159(x), r1=140(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x1), r6=142(y1), r7=304(x2), r8=232(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 140
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 142
LDI r7, 304
LDI r8, 232
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
