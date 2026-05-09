; DESCRIPTION: Draws a black circle centered at (199, 153) with radius 39.
; PLAN: r0=199(x), r1=153(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 153
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
