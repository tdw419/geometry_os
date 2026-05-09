; DESCRIPTION: Draws a magenta circle centered at (321, 61) with radius 41.
; PLAN: r0=321(x), r1=61(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 61
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
