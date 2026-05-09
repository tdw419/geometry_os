; DESCRIPTION: Draws a magenta circle centered at (405, 203) with radius 32.
; PLAN: r0=405(x), r1=203(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 203
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
