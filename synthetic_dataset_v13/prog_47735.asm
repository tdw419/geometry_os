; DESCRIPTION: Draws a magenta circle centered at (203, 162) with radius 12.
; PLAN: r0=203(x), r1=162(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 162
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
