; DESCRIPTION: Draws a black circle centered at (149, 161) with radius 45.
; PLAN: r0=149(x), r1=161(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 161
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
