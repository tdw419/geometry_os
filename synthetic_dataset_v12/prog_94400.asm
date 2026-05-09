; DESCRIPTION: Draws a magenta circle centered at (292, 134) with radius 61.
; PLAN: r0=292(x), r1=134(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 134
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
