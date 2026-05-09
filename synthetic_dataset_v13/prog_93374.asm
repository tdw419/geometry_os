; DESCRIPTION: Composite: Places a orange line segment connecting (101, 94) to (316, 53) then Draws a black circle centered at (355, 87) with radius 76.
; PLAN: r0=101(x1), r1=94(y1), r2=316(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=87(y), r7=76(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 101
LDI r1, 94
LDI r2, 316
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 87
LDI r7, 76
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
