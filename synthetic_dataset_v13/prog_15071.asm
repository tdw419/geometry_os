; DESCRIPTION: Draws a red circle centered at (101, 123) with radius 62.
; PLAN: r0=101(x), r1=123(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 123
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
