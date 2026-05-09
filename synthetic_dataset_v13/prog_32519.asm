; DESCRIPTION: Draws a red circle centered at (112, 198) with radius 43.
; PLAN: r0=112(x), r1=198(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 198
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
