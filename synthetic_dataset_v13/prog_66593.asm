; DESCRIPTION: Draws a black circle centered at (120, 151) with radius 60.
; PLAN: r0=120(x), r1=151(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 151
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
