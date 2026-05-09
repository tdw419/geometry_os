; DESCRIPTION: Draws a blue circle centered at (386, 118) with radius 62.
; PLAN: r0=386(x), r1=118(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 118
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
