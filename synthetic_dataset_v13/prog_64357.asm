; DESCRIPTION: Draws a yellow circle centered at (71, 62) with radius 35.
; PLAN: r0=71(x), r1=62(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 62
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
