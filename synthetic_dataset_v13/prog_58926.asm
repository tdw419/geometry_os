; DESCRIPTION: Draws a magenta circle centered at (127, 163) with radius 71.
; PLAN: r0=127(x), r1=163(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 163
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
