; DESCRIPTION: Draws a yellow circle centered at (20, 139) with radius 18.
; PLAN: r0=20(x), r1=139(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 20
LDI r1, 139
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
