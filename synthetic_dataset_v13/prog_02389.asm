; DESCRIPTION: Draws a green circle centered at (46, 139) with radius 43.
; PLAN: r0=46(x), r1=139(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 139
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
