; DESCRIPTION: Draws a green circle centered at (159, 205) with radius 21.
; PLAN: r0=159(x), r1=205(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 205
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
