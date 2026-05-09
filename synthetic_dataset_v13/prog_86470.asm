; DESCRIPTION: Draws a magenta circle centered at (326, 195) with radius 33.
; PLAN: r0=326(x), r1=195(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 195
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
