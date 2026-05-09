; DESCRIPTION: Draws a green circle centered at (94, 176) with radius 73.
; PLAN: r0=94(x), r1=176(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 176
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
