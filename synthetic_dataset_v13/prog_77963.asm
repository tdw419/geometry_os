; DESCRIPTION: Draws a red circle centered at (201, 61) with radius 26.
; PLAN: r0=201(x), r1=61(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 61
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
