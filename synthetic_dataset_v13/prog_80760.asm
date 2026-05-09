; DESCRIPTION: Draws a magenta circle centered at (286, 134) with radius 18.
; PLAN: r0=286(x), r1=134(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 134
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
