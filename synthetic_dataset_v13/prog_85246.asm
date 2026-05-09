; DESCRIPTION: Draws a black circle centered at (429, 90) with radius 76.
; PLAN: r0=429(x), r1=90(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 90
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
