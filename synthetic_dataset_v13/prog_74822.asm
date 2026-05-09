; DESCRIPTION: Draws a blue circle centered at (468, 118) with radius 22.
; PLAN: r0=468(x), r1=118(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 118
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
