; DESCRIPTION: Draws a magenta circle centered at (256, 161) with radius 18.
; PLAN: r0=256(x), r1=161(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 161
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
