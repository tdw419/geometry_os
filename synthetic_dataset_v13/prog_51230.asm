; DESCRIPTION: Draws a green circle centered at (69, 37) with radius 17.
; PLAN: r0=69(x), r1=37(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 37
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
