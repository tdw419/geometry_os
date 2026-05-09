; DESCRIPTION: Draws a blue circle centered at (126, 76) with radius 31.
; PLAN: r0=126(x), r1=76(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 76
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
