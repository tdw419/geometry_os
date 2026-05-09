; DESCRIPTION: Composite: Draws a red circle centered at (378, 227) with radius 19 then Places a orange line segment connecting (415, 85) to (350, 124).
; PLAN: r0=378(x), r1=227(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x1), r6=85(y1), r7=350(x2), r8=124(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 227
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 85
LDI r7, 350
LDI r8, 124
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
