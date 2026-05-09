; DESCRIPTION: Draws a black circle centered at (115, 143) with radius 60.
; PLAN: r0=115(x), r1=143(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 143
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
