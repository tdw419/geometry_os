; DESCRIPTION: Draws a black circle centered at (55, 57) with radius 53.
; PLAN: r0=55(x), r1=57(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 57
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
