; DESCRIPTION: Draws a red circle centered at (343, 74) with radius 63.
; PLAN: r0=343(x), r1=74(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 74
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
