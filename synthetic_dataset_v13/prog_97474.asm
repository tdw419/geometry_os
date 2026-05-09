; DESCRIPTION: Draws a red circle centered at (134, 38) with radius 10.
; PLAN: r0=134(x), r1=38(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 38
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
