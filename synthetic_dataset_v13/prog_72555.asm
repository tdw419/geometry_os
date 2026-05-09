; DESCRIPTION: Draws a magenta circle centered at (428, 73) with radius 60.
; PLAN: r0=428(x), r1=73(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 73
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
