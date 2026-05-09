; DESCRIPTION: Draws a black circle centered at (61, 59) with radius 49.
; PLAN: r0=61(x), r1=59(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 59
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
