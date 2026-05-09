; DESCRIPTION: Draws a magenta circle centered at (333, 183) with radius 39.
; PLAN: r0=333(x), r1=183(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 183
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
