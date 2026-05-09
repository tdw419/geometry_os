; DESCRIPTION: Draws a magenta circle centered at (82, 92) with radius 74.
; PLAN: r0=82(x), r1=92(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 92
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
