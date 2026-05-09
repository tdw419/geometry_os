; DESCRIPTION: Draws a green circle centered at (250, 37) with radius 34.
; PLAN: r0=250(x), r1=37(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 37
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
