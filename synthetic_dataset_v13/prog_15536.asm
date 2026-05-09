; DESCRIPTION: Draws a green circle centered at (201, 126) with radius 21.
; PLAN: r0=201(x), r1=126(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 126
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
