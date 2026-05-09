; DESCRIPTION: Draws a magenta circle centered at (258, 167) with radius 27.
; PLAN: r0=258(x), r1=167(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 167
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
