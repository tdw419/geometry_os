; DESCRIPTION: Draws a black circle centered at (112, 143) with radius 55.
; PLAN: r0=112(x), r1=143(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 143
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
