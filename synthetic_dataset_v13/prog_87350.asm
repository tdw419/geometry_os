; DESCRIPTION: Draws a black circle centered at (326, 75) with radius 59.
; PLAN: r0=326(x), r1=75(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 75
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
