; DESCRIPTION: Draws a blue circle centered at (87, 92) with radius 53.
; PLAN: r0=87(x), r1=92(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 92
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
