; DESCRIPTION: Draws a magenta circle centered at (286, 154) with radius 19.
; PLAN: r0=286(x), r1=154(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 154
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
