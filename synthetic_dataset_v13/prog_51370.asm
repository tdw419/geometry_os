; DESCRIPTION: Draws a purple circle centered at (386, 119) with radius 76.
; PLAN: r0=386(x), r1=119(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 119
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
