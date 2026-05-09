; DESCRIPTION: Draws a magenta circle centered at (120, 206) with radius 24.
; PLAN: r0=120(x), r1=206(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 206
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
