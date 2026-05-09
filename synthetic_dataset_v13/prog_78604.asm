; DESCRIPTION: Composite: Places a white line segment connecting (406, 25) to (257, 189) then Draws a orange circle centered at (378, 106) with radius 78.
; PLAN: r0=406(x1), r1=25(y1), r2=257(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=106(y), r7=78(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 406
LDI r1, 25
LDI r2, 257
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 106
LDI r7, 78
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
