; DESCRIPTION: Draws a red circle centered at (153, 66) with radius 37.
; PLAN: r0=153(x), r1=66(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 66
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
