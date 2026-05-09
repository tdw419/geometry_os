; DESCRIPTION: Draws a yellow circle centered at (186, 78) with radius 47.
; PLAN: r0=186(x), r1=78(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 78
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
