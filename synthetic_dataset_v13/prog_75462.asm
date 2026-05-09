; DESCRIPTION: Draws a yellow circle centered at (452, 193) with radius 34.
; PLAN: r0=452(x), r1=193(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 193
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
