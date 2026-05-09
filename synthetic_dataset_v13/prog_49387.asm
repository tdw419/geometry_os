; DESCRIPTION: Draws a yellow circle centered at (40, 57) with radius 18.
; PLAN: r0=40(x), r1=57(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 57
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
