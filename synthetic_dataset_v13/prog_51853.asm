; DESCRIPTION: Draws a red circle centered at (114, 158) with radius 57.
; PLAN: r0=114(x), r1=158(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 158
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
