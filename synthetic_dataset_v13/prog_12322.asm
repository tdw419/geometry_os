; DESCRIPTION: Draws a yellow circle centered at (475, 162) with radius 36.
; PLAN: r0=475(x), r1=162(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 475
LDI r1, 162
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
