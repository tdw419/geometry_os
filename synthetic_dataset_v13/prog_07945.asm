; DESCRIPTION: Draws a blue circle centered at (438, 180) with radius 73.
; PLAN: r0=438(x), r1=180(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 180
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
