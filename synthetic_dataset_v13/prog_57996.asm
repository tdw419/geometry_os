; DESCRIPTION: Draws a purple circle centered at (418, 180) with radius 52.
; PLAN: r0=418(x), r1=180(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 180
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
