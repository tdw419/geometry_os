; DESCRIPTION: Draws a red circle centered at (321, 88) with radius 16.
; PLAN: r0=321(x), r1=88(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 88
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
