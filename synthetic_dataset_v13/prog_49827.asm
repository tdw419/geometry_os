; DESCRIPTION: Draws a magenta circle centered at (98, 202) with radius 51.
; PLAN: r0=98(x), r1=202(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 202
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
