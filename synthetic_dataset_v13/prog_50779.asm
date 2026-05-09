; DESCRIPTION: Draws a green circle centered at (238, 225) with radius 23.
; PLAN: r0=238(x), r1=225(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 225
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
