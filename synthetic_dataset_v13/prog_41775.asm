; DESCRIPTION: Draws a yellow circle centered at (260, 118) with radius 73.
; PLAN: r0=260(x), r1=118(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 118
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
