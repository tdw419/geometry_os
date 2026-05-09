; DESCRIPTION: Draws a yellow circle centered at (429, 92) with radius 37.
; PLAN: r0=429(x), r1=92(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 92
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
