; DESCRIPTION: Draws a yellow circle centered at (439, 97) with radius 73.
; PLAN: r0=439(x), r1=97(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 97
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
