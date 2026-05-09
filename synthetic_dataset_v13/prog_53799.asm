; DESCRIPTION: Draws a magenta circle centered at (111, 213) with radius 32.
; PLAN: r0=111(x), r1=213(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 213
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
