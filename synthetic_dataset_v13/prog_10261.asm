; DESCRIPTION: Draws a green circle centered at (282, 149) with radius 73.
; PLAN: r0=282(x), r1=149(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 149
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
