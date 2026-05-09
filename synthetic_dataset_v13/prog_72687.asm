; DESCRIPTION: Draws a magenta circle centered at (405, 183) with radius 30.
; PLAN: r0=405(x), r1=183(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 183
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
