; DESCRIPTION: Draws a red circle centered at (191, 54) with radius 37.
; PLAN: r0=191(x), r1=54(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 54
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
