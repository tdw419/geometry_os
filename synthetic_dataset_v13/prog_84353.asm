; DESCRIPTION: Draws a orange circle centered at (378, 48) with radius 34.
; PLAN: r0=378(x), r1=48(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 48
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
