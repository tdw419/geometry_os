; DESCRIPTION: Draws a green circle centered at (440, 139) with radius 62.
; PLAN: r0=440(x), r1=139(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 139
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
