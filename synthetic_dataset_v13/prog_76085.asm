; DESCRIPTION: Composite: Renders a white line between points (347, 90) and (345, 66) then Creates a yellow circular shape at (287, 151) with radius 62.
; PLAN: r0=347(x1), r1=90(y1), r2=345(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=151(y), r7=62(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 347
LDI r1, 90
LDI r2, 345
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 151
LDI r7, 62
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
