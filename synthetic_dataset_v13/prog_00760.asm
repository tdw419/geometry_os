; DESCRIPTION: Draws a magenta circle centered at (238, 205) with radius 47.
; PLAN: r0=238(x), r1=205(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 205
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
