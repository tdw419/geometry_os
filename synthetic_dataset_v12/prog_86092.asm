; DESCRIPTION: Draws a red circle centered at (83, 60) with radius 43.
; PLAN: r0=83(x), r1=60(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 60
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
