; DESCRIPTION: Draws a green circle centered at (122, 150) with radius 49.
; PLAN: r0=122(x), r1=150(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 150
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
