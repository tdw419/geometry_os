; DESCRIPTION: Draws a blue circle centered at (207, 120) with radius 14.
; PLAN: r0=207(x), r1=120(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 120
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
