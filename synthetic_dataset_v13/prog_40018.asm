; DESCRIPTION: Draws a purple circle centered at (361, 175) with radius 23.
; PLAN: r0=361(x), r1=175(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 175
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
