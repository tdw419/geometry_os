; DESCRIPTION: Draws a red circle centered at (85, 135) with radius 13.
; PLAN: r0=85(x), r1=135(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 135
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
