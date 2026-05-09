; DESCRIPTION: Draws a red circle centered at (164, 88) with radius 55.
; PLAN: r0=164(x), r1=88(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 88
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
