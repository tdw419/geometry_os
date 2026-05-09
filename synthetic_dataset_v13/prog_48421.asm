; DESCRIPTION: Composite: Renders a orange disk with center (336, 46) and radius 35 then Renders a orange line between points (452, 106) and (372, 246).
; PLAN: r0=336(x), r1=46(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=452(x1), r6=106(y1), r7=372(x2), r8=246(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 46
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 452
LDI r6, 106
LDI r7, 372
LDI r8, 246
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
