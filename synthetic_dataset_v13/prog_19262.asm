; DESCRIPTION: Draws a magenta circle centered at (254, 226) with radius 24.
; PLAN: r0=254(x), r1=226(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 226
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
