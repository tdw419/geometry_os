; DESCRIPTION: Draws a blue circle centered at (291, 61) with radius 44.
; PLAN: r0=291(x), r1=61(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 61
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
