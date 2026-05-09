; DESCRIPTION: Composite: Renders a green disk with center (65, 158) and radius 43 then Places a red line segment connecting (454, 174) to (266, 94).
; PLAN: r0=65(x), r1=158(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x1), r6=174(y1), r7=266(x2), r8=94(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 158
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 174
LDI r7, 266
LDI r8, 94
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
