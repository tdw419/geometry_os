; DESCRIPTION: Draws a blue circle centered at (433, 95) with radius 63.
; PLAN: r0=433(x), r1=95(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 95
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
