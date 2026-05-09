; DESCRIPTION: Draws a green circle centered at (83, 47) with radius 23.
; PLAN: r0=83(x), r1=47(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 47
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
