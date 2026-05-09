; DESCRIPTION: Draws a purple circle centered at (435, 29) with radius 25.
; PLAN: r0=435(x), r1=29(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 29
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
