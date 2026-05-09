; DESCRIPTION: Draws a black circle centered at (185, 171) with radius 76.
; PLAN: r0=185(x), r1=171(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 171
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
