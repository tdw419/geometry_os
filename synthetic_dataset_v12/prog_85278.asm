; DESCRIPTION: Draws a magenta circle centered at (154, 179) with radius 29.
; PLAN: r0=154(x), r1=179(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 179
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
