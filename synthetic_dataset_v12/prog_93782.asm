; DESCRIPTION: Draws a purple circle centered at (349, 50) with radius 39.
; PLAN: r0=349(x), r1=50(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 50
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
