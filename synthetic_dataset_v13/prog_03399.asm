; DESCRIPTION: Draws a orange circle centered at (127, 184) with radius 71.
; PLAN: r0=127(x), r1=184(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 184
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
