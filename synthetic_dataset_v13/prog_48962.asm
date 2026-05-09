; DESCRIPTION: Draws a magenta circle centered at (434, 139) with radius 75.
; PLAN: r0=434(x), r1=139(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 139
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
