; DESCRIPTION: Draws a red circle centered at (423, 88) with radius 43.
; PLAN: r0=423(x), r1=88(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 88
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
