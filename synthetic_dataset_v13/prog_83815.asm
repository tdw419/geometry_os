; DESCRIPTION: Draws a magenta circle centered at (340, 97) with radius 62.
; PLAN: r0=340(x), r1=97(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 97
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
