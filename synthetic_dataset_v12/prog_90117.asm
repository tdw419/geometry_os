; DESCRIPTION: Draws a green circle centered at (262, 105) with radius 73.
; PLAN: r0=262(x), r1=105(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 105
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
