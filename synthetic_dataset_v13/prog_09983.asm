; DESCRIPTION: Draws a magenta circle centered at (365, 167) with radius 79.
; PLAN: r0=365(x), r1=167(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 167
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
