; DESCRIPTION: Draws a red circle centered at (244, 78) with radius 55.
; PLAN: r0=244(x), r1=78(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 78
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
