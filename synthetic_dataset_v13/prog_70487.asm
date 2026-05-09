; DESCRIPTION: Draws a yellow circle centered at (77, 35) with radius 30.
; PLAN: r0=77(x), r1=35(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 35
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
