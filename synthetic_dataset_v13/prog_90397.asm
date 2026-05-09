; DESCRIPTION: Draws a red circle centered at (119, 138) with radius 70.
; PLAN: r0=119(x), r1=138(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 138
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
