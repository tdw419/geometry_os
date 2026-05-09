; DESCRIPTION: Draws a black circle centered at (461, 177) with radius 49.
; PLAN: r0=461(x), r1=177(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 177
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
