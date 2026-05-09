; DESCRIPTION: Draws a magenta circle centered at (36, 224) with radius 13.
; PLAN: r0=36(x), r1=224(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 224
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
