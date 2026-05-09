; DESCRIPTION: Draws a blue circle centered at (195, 171) with radius 23.
; PLAN: r0=195(x), r1=171(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 171
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
