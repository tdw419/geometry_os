; DESCRIPTION: Draws a green circle centered at (216, 163) with radius 10.
; PLAN: r0=216(x), r1=163(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 163
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
