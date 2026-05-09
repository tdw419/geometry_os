; DESCRIPTION: Draws a magenta circle centered at (419, 217) with radius 18.
; PLAN: r0=419(x), r1=217(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 217
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
