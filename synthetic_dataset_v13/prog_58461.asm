; DESCRIPTION: Draws a magenta circle centered at (422, 113) with radius 11.
; PLAN: r0=422(x), r1=113(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 113
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
