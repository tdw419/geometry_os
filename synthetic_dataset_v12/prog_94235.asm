; DESCRIPTION: Draws a yellow circle centered at (418, 90) with radius 73.
; PLAN: r0=418(x), r1=90(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 90
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
