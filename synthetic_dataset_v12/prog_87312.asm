; DESCRIPTION: Draws a purple circle centered at (150, 70) with radius 52.
; PLAN: r0=150(x), r1=70(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 70
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
