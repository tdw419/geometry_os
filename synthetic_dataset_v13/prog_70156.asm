; DESCRIPTION: Draws a orange circle centered at (361, 81) with radius 57.
; PLAN: r0=361(x), r1=81(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 81
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
