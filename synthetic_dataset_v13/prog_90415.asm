; DESCRIPTION: Draws a green circle centered at (159, 98) with radius 80.
; PLAN: r0=159(x), r1=98(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 98
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
