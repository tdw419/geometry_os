; DESCRIPTION: Draws a yellow circle centered at (89, 175) with radius 80.
; PLAN: r0=89(x), r1=175(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 175
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
