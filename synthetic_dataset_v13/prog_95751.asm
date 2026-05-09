; DESCRIPTION: Draws a magenta circle centered at (286, 173) with radius 75.
; PLAN: r0=286(x), r1=173(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 173
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
