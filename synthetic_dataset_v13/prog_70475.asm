; DESCRIPTION: Draws a yellow circle centered at (158, 122) with radius 71.
; PLAN: r0=158(x), r1=122(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 122
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
