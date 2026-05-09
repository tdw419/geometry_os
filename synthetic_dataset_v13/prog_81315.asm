; DESCRIPTION: Draws a magenta circle centered at (256, 77) with radius 44.
; PLAN: r0=256(x), r1=77(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 77
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
