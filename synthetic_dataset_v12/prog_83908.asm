; DESCRIPTION: Draws a red circle centered at (204, 54) with radius 44.
; PLAN: r0=204(x), r1=54(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 54
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
