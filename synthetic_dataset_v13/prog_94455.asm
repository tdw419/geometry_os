; DESCRIPTION: Draws a red circle centered at (102, 219) with radius 34.
; PLAN: r0=102(x), r1=219(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 219
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
