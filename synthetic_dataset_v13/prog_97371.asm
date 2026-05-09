; DESCRIPTION: Draws a magenta circle centered at (365, 115) with radius 38.
; PLAN: r0=365(x), r1=115(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 115
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
