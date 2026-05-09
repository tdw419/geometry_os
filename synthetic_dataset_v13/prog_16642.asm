; DESCRIPTION: Draws a orange circle centered at (245, 73) with radius 55.
; PLAN: r0=245(x), r1=73(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 73
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
