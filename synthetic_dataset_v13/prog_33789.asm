; DESCRIPTION: Draws a red circle centered at (200, 141) with radius 43.
; PLAN: r0=200(x), r1=141(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 141
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
