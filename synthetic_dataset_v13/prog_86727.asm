; DESCRIPTION: Draws a magenta circle centered at (208, 86) with radius 39.
; PLAN: r0=208(x), r1=86(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 86
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
