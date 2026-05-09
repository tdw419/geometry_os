; DESCRIPTION: Draws a yellow circle centered at (117, 172) with radius 36.
; PLAN: r0=117(x), r1=172(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 172
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
