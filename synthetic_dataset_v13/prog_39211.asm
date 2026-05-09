; DESCRIPTION: Draws a red circle centered at (380, 123) with radius 15.
; PLAN: r0=380(x), r1=123(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 123
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
