; DESCRIPTION: Draws a red circle centered at (316, 62) with radius 50.
; PLAN: r0=316(x), r1=62(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 62
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
