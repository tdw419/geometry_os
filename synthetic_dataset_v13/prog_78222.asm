; DESCRIPTION: Draws a black circle centered at (60, 102) with radius 57.
; PLAN: r0=60(x), r1=102(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 102
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
