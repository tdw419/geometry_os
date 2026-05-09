; DESCRIPTION: Draws a orange circle centered at (343, 177) with radius 45.
; PLAN: r0=343(x), r1=177(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 177
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
