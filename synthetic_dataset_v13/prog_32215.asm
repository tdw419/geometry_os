; DESCRIPTION: Draws a red circle centered at (314, 158) with radius 55.
; PLAN: r0=314(x), r1=158(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 158
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
