; DESCRIPTION: Draws a green circle centered at (75, 115) with radius 45.
; PLAN: r0=75(x), r1=115(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 115
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
