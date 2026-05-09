; DESCRIPTION: Draws a black circle centered at (262, 76) with radius 13.
; PLAN: r0=262(x), r1=76(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 76
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
