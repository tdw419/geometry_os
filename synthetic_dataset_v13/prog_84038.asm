; DESCRIPTION: Draws a yellow circle centered at (363, 193) with radius 61.
; PLAN: r0=363(x), r1=193(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 193
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
