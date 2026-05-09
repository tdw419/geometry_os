; DESCRIPTION: Draws a magenta circle centered at (106, 126) with radius 39.
; PLAN: r0=106(x), r1=126(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 126
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
