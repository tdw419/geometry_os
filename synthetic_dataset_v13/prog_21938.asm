; DESCRIPTION: Draws a orange circle centered at (177, 105) with radius 67.
; PLAN: r0=177(x), r1=105(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 105
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
