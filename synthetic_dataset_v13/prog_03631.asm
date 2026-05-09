; DESCRIPTION: Draws a purple circle centered at (199, 176) with radius 52.
; PLAN: r0=199(x), r1=176(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 176
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
