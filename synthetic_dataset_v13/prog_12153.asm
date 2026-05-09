; DESCRIPTION: Draws a blue circle centered at (122, 93) with radius 20.
; PLAN: r0=122(x), r1=93(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 93
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
