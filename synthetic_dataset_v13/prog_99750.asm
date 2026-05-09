; DESCRIPTION: Draws a yellow circle centered at (423, 226) with radius 26.
; PLAN: r0=423(x), r1=226(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 226
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
