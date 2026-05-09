; DESCRIPTION: Draws a blue circle centered at (120, 65) with radius 61.
; PLAN: r0=120(x), r1=65(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 65
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
