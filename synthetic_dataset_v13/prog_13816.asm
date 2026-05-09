; DESCRIPTION: Draws a yellow circle centered at (247, 35) with radius 28.
; PLAN: r0=247(x), r1=35(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 35
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
