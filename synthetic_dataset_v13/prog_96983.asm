; DESCRIPTION: Draws a black circle centered at (182, 87) with radius 73.
; PLAN: r0=182(x), r1=87(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 87
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
