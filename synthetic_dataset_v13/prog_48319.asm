; DESCRIPTION: Draws a magenta circle centered at (325, 171) with radius 78.
; PLAN: r0=325(x), r1=171(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 171
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
