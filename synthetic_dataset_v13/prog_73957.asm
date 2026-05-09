; DESCRIPTION: Draws a orange circle centered at (141, 81) with radius 71.
; PLAN: r0=141(x), r1=81(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 81
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
