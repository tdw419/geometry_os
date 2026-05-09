; DESCRIPTION: Draws a magenta circle centered at (397, 82) with radius 73.
; PLAN: r0=397(x), r1=82(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 82
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
