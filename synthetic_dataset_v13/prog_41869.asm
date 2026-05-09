; DESCRIPTION: Draws a yellow circle centered at (192, 175) with radius 73.
; PLAN: r0=192(x), r1=175(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 175
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
