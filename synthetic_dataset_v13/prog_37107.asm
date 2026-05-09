; DESCRIPTION: Draws a magenta circle centered at (389, 149) with radius 74.
; PLAN: r0=389(x), r1=149(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 149
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
