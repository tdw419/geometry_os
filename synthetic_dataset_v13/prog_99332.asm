; DESCRIPTION: Draws a orange circle centered at (131, 177) with radius 78.
; PLAN: r0=131(x), r1=177(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 177
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
