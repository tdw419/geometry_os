; DESCRIPTION: Draws a black circle centered at (394, 81) with radius 34.
; PLAN: r0=394(x), r1=81(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 81
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
