; DESCRIPTION: Draws a magenta circle centered at (324, 106) with radius 59.
; PLAN: r0=324(x), r1=106(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 106
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
