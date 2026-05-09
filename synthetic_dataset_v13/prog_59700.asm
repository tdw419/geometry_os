; DESCRIPTION: Draws a black circle centered at (367, 86) with radius 74.
; PLAN: r0=367(x), r1=86(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 86
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
