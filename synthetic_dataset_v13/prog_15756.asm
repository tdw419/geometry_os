; DESCRIPTION: Draws a red circle centered at (275, 74) with radius 74.
; PLAN: r0=275(x), r1=74(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 74
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
