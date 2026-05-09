; DESCRIPTION: Draws a yellow circle centered at (331, 175) with radius 23.
; PLAN: r0=331(x), r1=175(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 175
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
