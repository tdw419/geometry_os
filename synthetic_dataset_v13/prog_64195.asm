; DESCRIPTION: Draws a yellow circle centered at (182, 139) with radius 15.
; PLAN: r0=182(x), r1=139(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 139
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
