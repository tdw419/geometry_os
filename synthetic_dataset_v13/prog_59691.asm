; DESCRIPTION: Draws a magenta circle centered at (401, 123) with radius 30.
; PLAN: r0=401(x), r1=123(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 123
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
