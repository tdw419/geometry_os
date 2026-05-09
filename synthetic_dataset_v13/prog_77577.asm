; DESCRIPTION: Draws a magenta circle centered at (57, 188) with radius 51.
; PLAN: r0=57(x), r1=188(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 188
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
