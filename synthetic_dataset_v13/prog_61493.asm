; DESCRIPTION: Draws a green circle centered at (181, 179) with radius 47.
; PLAN: r0=181(x), r1=179(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 179
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
