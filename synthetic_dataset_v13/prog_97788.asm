; DESCRIPTION: Draws a orange circle centered at (236, 183) with radius 52.
; PLAN: r0=236(x), r1=183(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 183
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
