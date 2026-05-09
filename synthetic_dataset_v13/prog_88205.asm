; DESCRIPTION: Draws a purple circle centered at (360, 83) with radius 75.
; PLAN: r0=360(x), r1=83(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 83
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
