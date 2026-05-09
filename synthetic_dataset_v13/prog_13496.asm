; DESCRIPTION: Draws a red circle centered at (83, 75) with radius 73.
; PLAN: r0=83(x), r1=75(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 75
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
