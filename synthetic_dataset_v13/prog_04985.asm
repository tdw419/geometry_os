; DESCRIPTION: Draws a magenta circle centered at (401, 128) with radius 75.
; PLAN: r0=401(x), r1=128(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 128
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
