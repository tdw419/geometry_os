; DESCRIPTION: Draws a yellow circle centered at (156, 140) with radius 66.
; PLAN: r0=156(x), r1=140(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 140
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
