; DESCRIPTION: Draws a magenta circle centered at (268, 44) with radius 24.
; PLAN: r0=268(x), r1=44(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 44
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
