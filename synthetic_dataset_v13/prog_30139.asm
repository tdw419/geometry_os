; DESCRIPTION: Draws a magenta circle centered at (51, 92) with radius 10.
; PLAN: r0=51(x), r1=92(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 92
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
