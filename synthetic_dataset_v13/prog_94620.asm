; DESCRIPTION: Draws a orange circle centered at (275, 150) with radius 53.
; PLAN: r0=275(x), r1=150(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 150
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
