; DESCRIPTION: Draws a orange circle centered at (474, 163) with radius 34.
; PLAN: r0=474(x), r1=163(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 163
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
