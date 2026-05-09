; DESCRIPTION: Draws a yellow circle centered at (301, 114) with radius 66.
; PLAN: r0=301(x), r1=114(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 114
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
