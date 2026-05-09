; DESCRIPTION: Draws a magenta circle centered at (226, 134) with radius 78.
; PLAN: r0=226(x), r1=134(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 134
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
