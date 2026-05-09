; DESCRIPTION: Draws a green circle centered at (161, 139) with radius 11.
; PLAN: r0=161(x), r1=139(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 139
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
