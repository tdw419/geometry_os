; DESCRIPTION: Draws a orange circle centered at (212, 177) with radius 43.
; PLAN: r0=212(x), r1=177(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 177
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
