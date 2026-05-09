; DESCRIPTION: Draws a red circle centered at (364, 183) with radius 45.
; PLAN: r0=364(x), r1=183(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 183
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
