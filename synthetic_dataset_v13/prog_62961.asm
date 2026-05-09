; DESCRIPTION: Draws a magenta circle centered at (243, 177) with radius 75.
; PLAN: r0=243(x), r1=177(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 177
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
