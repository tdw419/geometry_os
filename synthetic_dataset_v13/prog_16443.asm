; DESCRIPTION: Draws a magenta circle centered at (185, 140) with radius 70.
; PLAN: r0=185(x), r1=140(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 140
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
