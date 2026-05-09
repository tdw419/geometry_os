; DESCRIPTION: Draws a green circle centered at (139, 180) with radius 28.
; PLAN: r0=139(x), r1=180(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 180
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
