; DESCRIPTION: Draws a magenta circle centered at (112, 34) with radius 18.
; PLAN: r0=112(x), r1=34(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 34
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
