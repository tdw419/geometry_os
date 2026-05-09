; DESCRIPTION: Draws a magenta circle centered at (173, 63) with radius 28.
; PLAN: r0=173(x), r1=63(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 63
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
