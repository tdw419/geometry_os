; DESCRIPTION: Draws a green circle centered at (309, 94) with radius 76.
; PLAN: r0=309(x), r1=94(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 94
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
