; DESCRIPTION: Draws a black circle centered at (149, 109) with radius 47.
; PLAN: r0=149(x), r1=109(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 109
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
