; DESCRIPTION: Draws a black circle centered at (367, 90) with radius 64.
; PLAN: r0=367(x), r1=90(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 90
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
