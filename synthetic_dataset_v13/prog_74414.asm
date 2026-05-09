; DESCRIPTION: Composite: Draws a orange circle centered at (109, 106) with radius 76 then Sets a single white pixel at (289, 206).
; PLAN: r0=109(x), r1=106(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x), r6=206(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 109
LDI r1, 106
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 206
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
