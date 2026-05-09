; DESCRIPTION: Draws a yellow circle centered at (436, 132) with radius 53.
; PLAN: r0=436(x), r1=132(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 132
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
