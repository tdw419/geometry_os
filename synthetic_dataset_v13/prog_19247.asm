; DESCRIPTION: Draws a green circle centered at (389, 89) with radius 24.
; PLAN: r0=389(x), r1=89(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 89
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
