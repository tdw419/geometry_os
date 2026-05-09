; DESCRIPTION: Draws a black circle centered at (456, 148) with radius 38.
; PLAN: r0=456(x), r1=148(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 148
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
