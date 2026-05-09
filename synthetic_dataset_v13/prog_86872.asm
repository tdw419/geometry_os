; DESCRIPTION: Draws a magenta circle centered at (146, 75) with radius 11.
; PLAN: r0=146(x), r1=75(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 75
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
