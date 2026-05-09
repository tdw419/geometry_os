; DESCRIPTION: Draws a orange circle centered at (458, 140) with radius 54.
; PLAN: r0=458(x), r1=140(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 140
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
