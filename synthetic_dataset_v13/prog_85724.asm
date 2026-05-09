; DESCRIPTION: Draws a green circle centered at (303, 83) with radius 76.
; PLAN: r0=303(x), r1=83(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 83
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
