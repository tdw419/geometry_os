; DESCRIPTION: Composite: Draws a purple circle centered at (363, 43) with radius 35 then Renders a red line between points (112, 188) and (286, 89).
; PLAN: r0=363(x), r1=43(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x1), r6=188(y1), r7=286(x2), r8=89(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 43
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 188
LDI r7, 286
LDI r8, 89
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
