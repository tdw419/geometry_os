; DESCRIPTION: Draws a blue circle centered at (372, 118) with radius 50.
; PLAN: r0=372(x), r1=118(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 118
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
