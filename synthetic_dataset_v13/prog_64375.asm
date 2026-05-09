; DESCRIPTION: Composite: Draws a orange circle centered at (378, 99) with radius 45 then Renders a black line between points (419, 40) and (24, 141).
; PLAN: r0=378(x), r1=99(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x1), r6=40(y1), r7=24(x2), r8=141(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 99
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 40
LDI r7, 24
LDI r8, 141
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
